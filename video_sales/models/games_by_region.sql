with na_ranking as (
    select top 1
        name,
        platform,
        year,
        genre,
        publisher,
        'north america' as region,
        na_sales as sales
    from pc_fivetran_db.video_sales_schema.video_sales_table
    order by na_sales desc
),
jp_ranking as (
    select top 1
        name,
        platform,
        year,
        genre,
        publisher,
        'japan' as region,
        jp_sales as sales
    from pc_fivetran_db.video_sales_schema.video_sales_table
    order by jp_sales desc
),
eu_ranking as (
    select top 1
        name,
        platform,
        year,
        genre,
        publisher,
        'europe' as region,
        eu_sales as sales
    from pc_fivetran_db.video_sales_schema.video_sales_table
    order by eu_sales desc
),
other_ranking as (
    select top 1
        name,
        platform,
        year,
        genre,
        publisher,
        'other' as region,
        other_sales as sales
    from pc_fivetran_db.video_sales_schema.video_sales_table
    order by other_sales desc
),
global_ranking as (
    select top 1
        name,
        platform,
        year,
        genre,
        publisher,
        'global' as region,
        global_sales as sales
    from pc_fivetran_db.video_sales_schema.video_sales_table
    order by global_sales desc
),
final as (
    select
        *
    from na_ranking
    full outer join jp_ranking on 1=2
)
select * from na_ranking union all
select * from jp_ranking union all
select * from eu_ranking union all
select * from other_ranking union all
select * from global_ranking

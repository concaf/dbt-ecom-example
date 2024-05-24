with region_ranking as (
    select
        sum(jp_sales) as jp_total,
        sum(na_sales) as na_total,
        sum(eu_sales) as eu_total,
        sum(other_sales) as other_total,
        sum(global_sales) as global_total
    from pc_fivetran_db.video_sales_schema.video_sales_table
)

select * from region_ranking

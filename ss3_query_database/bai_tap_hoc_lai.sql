use library;


-- Lấy ra toàn bộ sách có trong thư viện, cùng với tên thể loại và tác giả					
DELIMITER //
CREATE procedure book_author_category()
begin
select books.title, authors.au_name, category.cate_name
from books
join authors on authors.au_id = books.au_id
join category on category.cate_id = books.cate_id;
end //
DELIMITER ;

call book_author_category();

-- Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp danh sách theo theo tên từ a->z						
select distinct students.s_name
from borrows
join students on students.s_id = borrows.s_id
order by students.s_name;

-- Lấy ra  2 quyển sách được mượn nhiều nhất			
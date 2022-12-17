<div class="col-xl-3 col-md-6 col-lg-3">
    <div class="footer_widget wow fadeInUp" data-wow-duration="1.2s" data-wow-delay=".5s">
        <h3 class="footer_title">
            Category
        </h3>
        <ul>
            <?php
            foreach ($categories as $category):?>
                <li><a href="/ln_job/jobs.php?nature_id=&name=&category_id=<?= $category['id']?>"><?=$category['name']?></a></li>
            <?php endforeach;?>
        </ul>
    </div>
</div>
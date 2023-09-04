<% if $PageImage %>
    <picture>
        <source
                srcset="$PageImage.FocusFill(2560,1440).Link 2560w,
                $PageImage.FocusFill(1920,1920).Link 1920w,
                $PageImage.FocusFill(1440,1440).Link 1440w,
                $PageImage.FocusFill(1024,1024).Link 1024w,
                $PageImage.FocusFill(768,860).Link 768w,
                $PageImage.FocusFill(414,600).Link 414w"
                media="(orientation:portrait)">
        <source
                srcset="$PageImage.FocusFill(2560,1100).Link 2560w,
                $PageImage.FocusFill(1920,850).Link 1920w,
                $PageImage.FocusFill(1440,650).Link 1440w,
                $PageImage.FocusFill(1024,900).Link 1024w,
                $PageImage.FocusFill(768,860).Link 768w,
                $PageImage.FocusFill(414,600).Link 414w"
                media="(orientation:landscape)">
        <img class="page-image d-block" src="$PageImage.FocusFill(2560,1100).Link" alt="$PageImage.Title" width="100%">
    </picture>
<% else_if $SiteConfig.DefaultPageImage %>
    <picture>
        <source
                srcset="$SiteConfig.DefaultPageImage.FocusFill(2560,1440).Link 2560w,
                $SiteConfig.DefaultPageImage.FocusFill(1920,1920).Link 1920w,
                $SiteConfig.DefaultPageImage.FocusFill(1440,1440).Link 1440w,
                $SiteConfig.DefaultPageImage.FocusFill(1024,1024).Link 1024w,
                $SiteConfig.DefaultPageImage.FocusFill(768,860).Link 768w,
                $SiteConfig.DefaultPageImage.FocusFill(414,600).Link 414w"
                media="(orientation:portrait)">
        <source
                srcset="$SiteConfig.DefaultPageImage.FocusFill(2560,1100).Link 2560w,
                $SiteConfig.DefaultPageImage.FocusFill(1920,850).Link 1920w,
                $SiteConfig.DefaultPageImage.FocusFill(1440,650).Link 1440w,
                $SiteConfig.DefaultPageImage.FocusFill(1024,900).Link 1024w,
                $SiteConfig.DefaultPageImage.FocusFill(768,860).Link 768w,
                $SiteConfig.DefaultPageImage.FocusFill(414,600).Link 414w"
                media="(orientation:landscape)">
        <img class="page-image d-block" src="$SiteConfig.DefaultPageImage.FocusFill(2560,1100).Link" alt="$SiteConfig.DefaultPageImage.Title" width="100%">
    </picture>
<% end_if %>
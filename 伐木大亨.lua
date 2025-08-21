html
  
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>个人作品集 | Portfolio</title>
  <!-- 引入Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- 引入Font Awesome -->
  <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <!-- 配置Tailwind主题 -->
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            primary: '#3B82F6', // 蓝色主色调
            secondary: '#10B981', // 绿色辅助色
            dark: '#1F2937', // 深色背景
            light: '#F3F4F6', // 浅色背景
          },
          fontFamily: {
            sans: ['Inter', 'system-ui', 'sans-serif'],
          },
        },
      }
    }
  </script>
  <!-- 自定义工具类 -->
  <style type="text/tailwindcss">
    @layer utilities {
      .content-auto {
        content-visibility: auto;
      }
      .text-shadow {
        text-shadow: 0 2px 4px rgba(0,0,0,0.1);
      }
      .card-hover {
        transition: all 0.3s ease;
      }
      .card-hover:hover {
        transform: translateY(-5px);
      }
    }
  </style>
  <style>
    /* 基础动画 */
    html {
      scroll-behavior: smooth;
    }
    .fade-in {
      animation: fadeIn 0.8s ease forwards;
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    /* 导航栏滚动效果 */
    .nav-scrolled {
      background-color: rgba(255, 255, 255, 0.95);
      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
    }
  </style>
</head>
<body class="bg-light text-dark">
  <!-- 导航栏 -->
  <nav id="navbar" class="fixed w-full z-50 transition-all duration-300 py-4">
    <div class="container mx-auto px-4 md:px-6">
      <div class="flex justify-between items-center">
        <!-- Logo -->
        <a href="#" class="text-2xl font-bold text-primary flex items-center">
          <<i class="fa fa-paint-brush mr-2"></</i>
          <span>Portfolio</span>
        </a>
        
        <!-- 桌面端导航 -->
        <div class="hidden md:flex space-x-8">
          <a href="#home" class="font-medium hover:text-primary transition">首页</a>
          <a href="#works" class="font-medium hover:text-primary transition">作品</a>
          <a href="#skills" class="font-medium hover:text-primary transition">技能</a>
          <a href="#contact" class="font-medium hover:text-primary transition">联系我</a>
        </div>
        
        <!-- 移动端菜单按钮 -->
        <button id="menuBtn" class="md:hidden text-dark text-2xl">
          <<i class="fa fa-bars"></</i>
        </button>
      </div>
    </div>
    
    <!-- 移动端导航菜单 -->
    <div id="mobileMenu" class="hidden md:hidden bg-white absolute w-full mt-4 py-4 shadow-lg">
      <div class="container mx-auto px-4 flex flex-col space-y-4">
        <a href="#home" class="font-medium hover:text-primary transition py-2">首页</a>
        <a href="#works" class="font-medium hover:text-primary transition py-2">作品</a>
        <a href="#skills" class="font-medium hover:text-primary transition py-2">技能</a>
        <a href="#contact" class="font-medium hover:text-primary transition py-2">联系我</a>
      </div>
    </div>
  </nav>

  <!-- 英雄区 -->
  <section id="home" class="pt-32 pb-20 md:pt-40 md:pb-32 bg-gradient-to-br from-blue-50 to-green-50">
    <div class="container mx-auto px-4 md:px-6">
      <div class="flex flex-col md:flex-row items-center gap-12">
        <!-- 文字内容 -->
        <div class="md:w-1/2 fade-in">
          <h1 class="text-[clamp(2rem,5vw,3.5rem)] font-bold leading-tight text-shadow mb-4">
            创意设计<br>
            <span class="text-primary">成就品牌价值</span>
          </h1>
          <p class="text-lg md:text-xl text-gray-600 mb-8 max-w-lg">
            我是一名UI/UX设计师，专注于创造美观且实用的数字体验，让产品与用户产生深度连接。
          </p>
          <div class="flex flex-wrap gap-4">
            <a href="#works" class="px-6 py-3 bg-primary text-white rounded-lg font-medium hover:bg-primary/90 transition shadow-lg">
              查看作品
            </a>
            <a href="#contact" class="px-6 py-3 bg-white text-primary border border-primary rounded-lg font-medium hover:bg-gray-50 transition shadow-md">
              联系我
            </a>
          </div>
        </div>
        <!-- 头像/图片 -->
        <div class="md:w-1/2 fade-in" style="animation-delay: 0.3s;">
          <div class="relative">
            <div class="absolute -inset-4 bg-gradient-to-r from-primary to-secondary rounded-full blur-xl opacity-20"></div>
            <img src="https://picsum.photos/id/1005/600/600" alt="设计师头像" class="relative z-10 w-full max-w-md mx-auto rounded-2xl shadow-2xl object-cover aspect-square">
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 作品展示区 -->
  <section id="works" class="py-20 bg-white">
    <div class="container mx-auto px-4 md:px-6">
      <div class="text-center mb-16 fade-in">
        <h2 class="text-[clamp(1.8rem,4vw,2.5rem)] font-bold mb-4">精选作品</h2>
        <p class="text-gray-600 max-w-2xl mx-auto">探索我的设计案例，每一个作品都融合了创意与功能性，致力于解决实际问题</p>
      </div>
      
      <!-- 作品网格 -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <!-- 作品1 -->
        <div class="bg-light rounded-xl overflow-hidden shadow-md card-hover fade-in" style="animation-delay: 0.1s;">
          <img src="https://picsum.photos/id/1/600/400" alt="移动应用设计" class="w-full h-56 object-cover">
          <div class="p-6">
            <h3 class="text-xl font-bold mb-2">健康管理APP</h3>
            <p class="text-gray-600 mb-4">一款专注于健康数据追踪与分析的移动应用，简洁直观的界面设计提升用户体验。</p>
            <div class="flex items-center justify-between">
              <span class="text-sm text-primary font-medium">UI/UX设计</span>
              <a href="#" class="text-dark hover:text-primary transition">
                <<i class="fa fa-arrow-right"></</i> 查看详情
              </a>
            </div>
          </div>
        </div>
        
        <!-- 作品2 -->
        <div class="bg-light rounded-xl overflow-hidden shadow-md card-hover fade-in" style="animation-delay: 0.2s;">
          <img src="https://picsum.photos/id/20/600/400" alt="网站重设计" class="w-full h-56 object-cover">
          <div class="p-6">
            <h3 class="text-xl font-bold mb-2">电商网站重设计</h3>
            <p class="text-gray-600 mb-4">为电商平台进行全链路重设计，优化转化率与用户留存，提升品牌视觉形象。</p>
            <div class="flex items-center justify-between">
              <span class="text-sm text-primary font-medium">网页设计</span>
              <a href="#" class="text-dark hover:text-primary transition">
                <<i class="fa fa-arrow-right"></</i> 查看详情
              </a>
            </div>
          </div>
        </div>
        
        <!-- 作品3 -->
        <div class="bg-light rounded-xl overflow-hidden shadow-md card-hover fade-in" style="animation-delay: 0.3s;">
          <img src="https://picsum.photos/id/96/600/400" alt="品牌设计" class="w-full h-56 object-cover">
          <div class="p-6">
            <h3 class="text-xl font-bold mb-2">咖啡品牌视觉设计</h3>
            <p class="text-gray-600 mb-4">为精品咖啡品牌打造全套视觉识别系统，包括Logo、包装与线下物料设计。</p>
            <div class="flex items-center justify-between">
              <span class="text-sm text-primary font-medium">品牌设计</span>
              <a href="#" class="text-dark hover:text-primary transition">
                <<i class="fa fa-arrow-right"></</i> 查看详情
              </a>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 查看更多按钮 -->
      <div class="text-center mt-12">
        <a href="#" class="inline-block px-8 py-3 border border-primary text-primary rounded-lg font-medium hover:bg-primary hover:text-white transition">
          查看更多作品 <<i class="fa fa-long-arrow-right ml-2"></</i>
        </a>
      </div>
    </div>
  </section>

  <!-- 技能标签区 -->
  <section id="skills" class="py-20 bg-gray-50">
    <div class="container mx-auto px-4 md:px-6">
      <div class="text-center mb-16 fade-in">
        <h2 class="text-[clamp(1.8rem,4vw,2.5rem)] font-bold mb-4">专业技能</h2>
        <p class="text-gray-600 max-w-2xl mx-auto">多年设计经验积累的专业技能，助力打造高品质数字产品</p>
      </div>
      
      <!-- 技能标签网格 -->
      <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
        <!-- 技能1 -->
        <div class="bg-white p-6 rounded-xl shadow-md text-center card-hover fade-in" style="animation-delay: 0.1s;">
          <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <<i class="fa fa-desktop text-2xl text-primary"></</i>
          </div>
          <h3 class="text-lg font-bold mb-2">UI设计</h3>
          <p class="text-gray-600 text-sm">界面视觉设计、组件库搭建、设计系统规范</p>
        </div>
        
        <!-- 技能2 -->
        <div class="bg-white p-6 rounded-xl shadow-md text-center card-hover fade-in" style="animation-delay: 0.2s;">
          <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <<i class="fa fa-mobile text-2xl text-secondary"></</i>
          </div>
          <h3 class="text-lg font-bold mb-2">UX设计</h3>
          <p class="text-gray-600 text-sm">用户研究、原型设计、可用性测试、交互逻辑</p>
        </div>
        
        <!-- 技能3 -->
        <div class="bg-white p-6 rounded-xl shadow-md text-center card-hover fade-in" style="animation-delay: 0.3s;">
          <div class="w-16 h-16 bg-purple-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <<i class="fa fa-paint-brush text-2xl text-purple-500"></</i>
          </div>
          <h3 class="text-lg font-bold mb-2">品牌设计</h3>
          <p class="text-gray-600 text-sm">Logo设计、VI系统、品牌视觉识别、包装设计</p>
        </div>
        
        <!-- 技能4 -->
        <div class="bg-white p-6 rounded-xl shadow-md text-center card-hover fade-in" style="animation-delay: 0.4s;">
          <div class="w-16 h-16 bg-yellow-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <<i class="fa fa-code text-2xl text-yellow-500"></</i>
          </div>
          <h3 class="text-lg font-bold mb-2">前端开发</h3>
          <p class="text-gray-600 text-sm">HTML/CSS、响应式布局、基础JavaScript、Tailwind</p>
        </div>
      </div>
    </div>
  </section>

  <!-- 联系区 -->
  <section id="contact" class="py-20 bg-white">
    <div class="container mx-auto px-4 md:px-6">
      <div class="max-w-4xl mx-auto">
        <div class="text-center mb-16 fade-in">
          <h2 class="text-[clamp(1.8rem,4vw,2.5rem)] font-bold mb-4">联系我</h2>
          <p class="text-gray-600 max-w-2xl mx-auto">有项目合作或设计需求？随时与我联系，我将尽快回复</p>
        </div>
        
        <div class="bg-light rounded-2xl p-8 md:p-10 shadow-lg fade-in">
          <form id="contactForm" class="space-y-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label for="name" class="block text-gray-700 font-medium mb-2">姓名</label>
                <input type="text" id="name" class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition" placeholder="请输入您的姓名">
              </div>
              <div>
                <label for="email" class="block text-gray-700 font-medium mb-2">邮箱</label>
                <input type="email" id="email" class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition" placeholder="请输入您的邮箱">
              </div>
            </div>
            
            <div>
              <label for="subject" class="block text-gray-700 font-medium mb-2">主题</label>
              <input type="text" id="subject" class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition" placeholder="请输入消息主题">
            </div>
            
            <div>
              <label for="message" class="block text-gray-700 font-medium mb-2">消息内容</label>
              <textarea id="message" rows="5" class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition" placeholder="请输入您的消息内容"></textarea>
            </div>
            
            <button type="submit" class="w-full md:w-auto px-8 py-3 bg-primary text-white rounded-lg font-medium hover:bg-primary/90 transition shadow-lg">
              发送消息 <<i class="fa fa-paper-plane ml-2"></</i>
            </button>
          </form>

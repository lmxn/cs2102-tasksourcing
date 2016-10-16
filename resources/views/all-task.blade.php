    @extends('master')

    @section('title', 'Tasks')

    @section('sidebar-active-item')
    <a class="active item">Tasks</a>
    @stop

    @section('content')
    <div class="ui vertical stripe segment">
      <div class="doubling stackable ui grid container">
        <div class="sixteen wide column">
          <h2>Available Tasks</h2>
          <table class="ui celled table green">
            <thead>
              <tr><th>Name</th>
                <th>Description</th>
                <th>Category</th>
                <th>Posted by</th>
              </tr></thead>
              <tbody>
                @foreach($tasks as $task)
                <tr class="top aligned">
                  <td>{{ link_to_route('tasks.show', $task->task_name, $task->t_id)}}</td>
                  <td>Location: {{ $task->location }}<br><br>{!! $task->task_description !!}</td>
                  <td>{{ $task->category_name }}</td>
                  <td>
                    <h4 class="ui image header">
                      <img src="{{ asset('img/users/'.$task->profile_photo) }}" class="ui mini avatar image">
                      <div class="content">
                        {{ $task->username }}
                        <div class="sub header">{{ $task->reputation }}</div>
                      </div>
                    </h4>
                  </td>
                </tr>
                @endforeach
              </tbody>
              <tfoot>
                <tr><th colspan="5">
                  <div class="ui right floated pagination menu">
                    <a class="icon item">
                      <i class="left chevron icon"></i>
                    </a>
                    <a class="item">1</a>
                    <a class="item">2</a>
                    <a class="item">3</a>
                    <a class="item">4</a>
                    <a class="icon item">
                      <i class="right chevron icon"></i>
                    </a>
                  </div>
                </th>
              </tr></tfoot>
            </table>
        </div>
      </div>
    </div>

    @stop
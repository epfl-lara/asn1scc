; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68508 () Bool)

(assert start!68508)

(declare-fun mapNonEmpty!2531 () Bool)

(declare-fun mapRes!2532 () Bool)

(declare-fun tp!2531 () Bool)

(declare-fun tp_is_empty!789 () Bool)

(assert (=> mapNonEmpty!2531 (= mapRes!2532 (and tp!2531 tp_is_empty!789))))

(declare-fun mapKey!2531 () (_ BitVec 32))

(declare-datatypes ((T!57615 0))(
  ( (T!57616 (val!394 Int)) )
))
(declare-fun mapValue!2532 () T!57615)

(declare-datatypes ((array!18653 0))(
  ( (array!18654 (arr!9164 (Array (_ BitVec 32) T!57615)) (size!8081 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18653)

(declare-fun mapRest!2532 () (Array (_ BitVec 32) T!57615))

(assert (=> mapNonEmpty!2531 (= (arr!9164 a1!506) (store mapRest!2532 mapKey!2531 mapValue!2532))))

(declare-fun b!307763 () Bool)

(declare-fun res!252525 () Bool)

(declare-fun e!221722 () Bool)

(assert (=> b!307763 (=> (not res!252525) (not e!221722))))

(declare-fun fromSlice!41 () (_ BitVec 32))

(declare-fun to!599 () (_ BitVec 32))

(assert (=> b!307763 (= res!252525 (bvsle fromSlice!41 to!599))))

(declare-fun b!307764 () Bool)

(declare-fun toSlice!41 () (_ BitVec 32))

(declare-fun a2!506 () array!18653)

(declare-fun arrayRangesEq!1705 (array!18653 array!18653 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307764 (= e!221722 (not (arrayRangesEq!1705 a1!506 a2!506 to!599 toSlice!41)))))

(declare-fun res!252523 () Bool)

(assert (=> start!68508 (=> (not res!252523) (not e!221722))))

(declare-fun from!632 () (_ BitVec 32))

(assert (=> start!68508 (= res!252523 (and (bvsle #b00000000000000000000000000000000 from!632) (bvsle from!632 to!599) (bvsle (size!8081 a1!506) (size!8081 a2!506)) (bvsle to!599 (size!8081 a1!506)) (bvsle from!632 fromSlice!41) (bvsle fromSlice!41 toSlice!41) (bvsle toSlice!41 to!599)))))

(assert (=> start!68508 e!221722))

(assert (=> start!68508 true))

(declare-fun e!221723 () Bool)

(declare-fun array_inv!7687 (array!18653) Bool)

(assert (=> start!68508 (and (array_inv!7687 a1!506) e!221723)))

(declare-fun e!221724 () Bool)

(assert (=> start!68508 (and (array_inv!7687 a2!506) e!221724)))

(declare-fun mapIsEmpty!2531 () Bool)

(assert (=> mapIsEmpty!2531 mapRes!2532))

(declare-fun b!307765 () Bool)

(declare-fun res!252526 () Bool)

(assert (=> b!307765 (=> (not res!252526) (not e!221722))))

(assert (=> b!307765 (= res!252526 (arrayRangesEq!1705 a1!506 a2!506 to!599 to!599))))

(declare-fun mapIsEmpty!2532 () Bool)

(declare-fun mapRes!2531 () Bool)

(assert (=> mapIsEmpty!2532 mapRes!2531))

(declare-fun mapNonEmpty!2532 () Bool)

(declare-fun tp!2532 () Bool)

(assert (=> mapNonEmpty!2532 (= mapRes!2531 (and tp!2532 tp_is_empty!789))))

(declare-fun mapRest!2531 () (Array (_ BitVec 32) T!57615))

(declare-fun mapValue!2531 () T!57615)

(declare-fun mapKey!2532 () (_ BitVec 32))

(assert (=> mapNonEmpty!2532 (= (arr!9164 a2!506) (store mapRest!2531 mapKey!2532 mapValue!2531))))

(declare-fun b!307766 () Bool)

(assert (=> b!307766 (= e!221724 (and tp_is_empty!789 mapRes!2531))))

(declare-fun condMapEmpty!2531 () Bool)

(declare-fun mapDefault!2531 () T!57615)

(assert (=> b!307766 (= condMapEmpty!2531 (= (arr!9164 a2!506) ((as const (Array (_ BitVec 32) T!57615)) mapDefault!2531)))))

(declare-fun b!307767 () Bool)

(declare-fun res!252524 () Bool)

(assert (=> b!307767 (=> (not res!252524) (not e!221722))))

(assert (=> b!307767 (= res!252524 (bvsle to!599 toSlice!41))))

(declare-fun b!307768 () Bool)

(declare-fun res!252527 () Bool)

(assert (=> b!307768 (=> (not res!252527) (not e!221722))))

(assert (=> b!307768 (= res!252527 (arrayRangesEq!1705 a1!506 a2!506 from!632 to!599))))

(declare-fun b!307769 () Bool)

(assert (=> b!307769 (= e!221723 (and tp_is_empty!789 mapRes!2532))))

(declare-fun condMapEmpty!2532 () Bool)

(declare-fun mapDefault!2532 () T!57615)

(assert (=> b!307769 (= condMapEmpty!2532 (= (arr!9164 a1!506) ((as const (Array (_ BitVec 32) T!57615)) mapDefault!2532)))))

(assert (= (and start!68508 res!252523) b!307768))

(assert (= (and b!307768 res!252527) b!307763))

(assert (= (and b!307763 res!252525) b!307765))

(assert (= (and b!307765 res!252526) b!307767))

(assert (= (and b!307767 res!252524) b!307764))

(assert (= (and b!307769 condMapEmpty!2532) mapIsEmpty!2531))

(assert (= (and b!307769 (not condMapEmpty!2532)) mapNonEmpty!2531))

(assert (= start!68508 b!307769))

(assert (= (and b!307766 condMapEmpty!2531) mapIsEmpty!2532))

(assert (= (and b!307766 (not condMapEmpty!2531)) mapNonEmpty!2532))

(assert (= start!68508 b!307766))

(declare-fun m!446273 () Bool)

(assert (=> b!307764 m!446273))

(declare-fun m!446275 () Bool)

(assert (=> mapNonEmpty!2532 m!446275))

(declare-fun m!446277 () Bool)

(assert (=> b!307765 m!446277))

(declare-fun m!446279 () Bool)

(assert (=> b!307768 m!446279))

(declare-fun m!446281 () Bool)

(assert (=> mapNonEmpty!2531 m!446281))

(declare-fun m!446283 () Bool)

(assert (=> start!68508 m!446283))

(declare-fun m!446285 () Bool)

(assert (=> start!68508 m!446285))

(check-sat (not mapNonEmpty!2532) (not b!307765) (not mapNonEmpty!2531) (not start!68508) tp_is_empty!789 (not b!307768) (not b!307764))
(check-sat)

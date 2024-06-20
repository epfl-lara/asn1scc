; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68580 () Bool)

(assert start!68580)

(declare-fun mapNonEmpty!2747 () Bool)

(declare-fun mapRes!2747 () Bool)

(declare-fun tp!2747 () Bool)

(declare-fun tp_is_empty!861 () Bool)

(assert (=> mapNonEmpty!2747 (= mapRes!2747 (and tp!2747 tp_is_empty!861))))

(declare-datatypes ((T!57927 0))(
  ( (T!57928 (val!430 Int)) )
))
(declare-fun mapRest!2747 () (Array (_ BitVec 32) T!57927))

(declare-datatypes ((array!18725 0))(
  ( (array!18726 (arr!9200 (Array (_ BitVec 32) T!57927)) (size!8117 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18725)

(declare-fun mapValue!2747 () T!57927)

(declare-fun mapKey!2747 () (_ BitVec 32))

(assert (=> mapNonEmpty!2747 (= (arr!9200 a2!524) (store mapRest!2747 mapKey!2747 mapValue!2747))))

(declare-fun b!308693 () Bool)

(declare-fun e!222170 () Bool)

(assert (=> b!308693 (= e!222170 (and tp_is_empty!861 mapRes!2747))))

(declare-fun condMapEmpty!2747 () Bool)

(declare-fun mapDefault!2748 () T!57927)

(assert (=> b!308693 (= condMapEmpty!2747 (= (arr!9200 a2!524) ((as const (Array (_ BitVec 32) T!57927)) mapDefault!2748)))))

(declare-fun mapNonEmpty!2748 () Bool)

(declare-fun mapRes!2748 () Bool)

(declare-fun tp!2748 () Bool)

(assert (=> mapNonEmpty!2748 (= mapRes!2748 (and tp!2748 tp_is_empty!861))))

(declare-fun mapRest!2748 () (Array (_ BitVec 32) T!57927))

(declare-fun a1!524 () array!18725)

(declare-fun mapValue!2748 () T!57927)

(declare-fun mapKey!2748 () (_ BitVec 32))

(assert (=> mapNonEmpty!2748 (= (arr!9200 a1!524) (store mapRest!2748 mapKey!2748 mapValue!2748))))

(declare-fun mapIsEmpty!2747 () Bool)

(assert (=> mapIsEmpty!2747 mapRes!2747))

(declare-fun b!308694 () Bool)

(declare-fun res!253240 () Bool)

(declare-fun e!222171 () Bool)

(assert (=> b!308694 (=> res!253240 e!222171)))

(declare-fun e!222173 () Bool)

(assert (=> b!308694 (= res!253240 e!222173)))

(declare-fun res!253246 () Bool)

(assert (=> b!308694 (=> (not res!253246) (not e!222173))))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!308694 (= res!253246 (bvsle (bvsub i!932 #b00000000000000000000000000000001) toSlice!46))))

(declare-fun b!308695 () Bool)

(declare-fun e!222174 () Bool)

(assert (=> b!308695 (= e!222174 (and tp_is_empty!861 mapRes!2748))))

(declare-fun condMapEmpty!2748 () Bool)

(declare-fun mapDefault!2747 () T!57927)

(assert (=> b!308695 (= condMapEmpty!2748 (= (arr!9200 a1!524) ((as const (Array (_ BitVec 32) T!57927)) mapDefault!2747)))))

(declare-fun b!308697 () Bool)

(declare-fun arrayRangesEq!1733 (array!18725 array!18725 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308697 (= e!222173 (not (arrayRangesEq!1733 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) toSlice!46)))))

(declare-fun b!308698 () Bool)

(declare-fun res!253241 () Bool)

(declare-fun e!222172 () Bool)

(assert (=> b!308698 (=> (not res!253241) (not e!222172))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!308698 (= res!253241 (not (= i!932 fromSlice!46)))))

(declare-fun b!308699 () Bool)

(declare-fun e!222169 () Bool)

(assert (=> b!308699 (= e!222169 (arrayRangesEq!1733 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!308700 () Bool)

(declare-fun res!253245 () Bool)

(assert (=> b!308700 (=> (not res!253245) (not e!222172))))

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(assert (=> b!308700 (= res!253245 (arrayRangesEq!1733 a1!524 a2!524 from!650 to!617))))

(declare-fun b!308701 () Bool)

(declare-fun res!253238 () Bool)

(assert (=> b!308701 (=> (not res!253238) (not e!222172))))

(assert (=> b!308701 (= res!253238 e!222169)))

(declare-fun res!253239 () Bool)

(assert (=> b!308701 (=> res!253239 e!222169)))

(assert (=> b!308701 (= res!253239 (bvsgt i!932 toSlice!46))))

(declare-fun b!308702 () Bool)

(declare-fun res!253244 () Bool)

(assert (=> b!308702 (=> (not res!253244) (not e!222172))))

(assert (=> b!308702 (= res!253244 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun mapIsEmpty!2748 () Bool)

(assert (=> mapIsEmpty!2748 mapRes!2748))

(declare-fun b!308703 () Bool)

(declare-fun res!253243 () Bool)

(assert (=> b!308703 (=> (not res!253243) (not e!222172))))

(assert (=> b!308703 (= res!253243 (arrayRangesEq!1733 a1!524 a2!524 i!932 to!617))))

(declare-fun res!253237 () Bool)

(assert (=> start!68580 (=> (not res!253237) (not e!222172))))

(assert (=> start!68580 (= res!253237 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8117 a1!524) (size!8117 a2!524)) (bvsle to!617 (size!8117 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68580 e!222172))

(assert (=> start!68580 true))

(declare-fun array_inv!7706 (array!18725) Bool)

(assert (=> start!68580 (and (array_inv!7706 a2!524) e!222170)))

(assert (=> start!68580 (and (array_inv!7706 a1!524) e!222174)))

(declare-fun b!308696 () Bool)

(assert (=> b!308696 (= e!222171 (or (bvsgt #b00000000000000000000000000000000 fromSlice!46) (bvsle toSlice!46 (size!8117 a1!524))))))

(assert (=> b!308696 (arrayRangesEq!1733 a1!524 a2!524 fromSlice!46 toSlice!46)))

(declare-datatypes ((Unit!21473 0))(
  ( (Unit!21474) )
))
(declare-fun lt!440343 () Unit!21473)

(declare-fun rec!101 (array!18725 array!18725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21473)

(assert (=> b!308696 (= lt!440343 (rec!101 a1!524 a2!524 from!650 fromSlice!46 to!617 toSlice!46 (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-fun b!308704 () Bool)

(declare-fun res!253242 () Bool)

(assert (=> b!308704 (=> res!253242 e!222171)))

(assert (=> b!308704 (= res!253242 (not (arrayRangesEq!1733 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-fun b!308705 () Bool)

(assert (=> b!308705 (= e!222172 (not e!222171))))

(declare-fun res!253247 () Bool)

(assert (=> b!308705 (=> res!253247 e!222171)))

(assert (=> b!308705 (= res!253247 (or (bvsgt fromSlice!46 (bvsub i!932 #b00000000000000000000000000000001)) (bvsgt (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(assert (=> b!308705 (= (select (arr!9200 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9200 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-fun lt!440342 () Unit!21473)

(declare-fun arrayRangesEqImpliesEq!307 (array!18725 array!18725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21473)

(assert (=> b!308705 (= lt!440342 (arrayRangesEqImpliesEq!307 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(assert (= (and start!68580 res!253237) b!308700))

(assert (= (and b!308700 res!253245) b!308702))

(assert (= (and b!308702 res!253244) b!308703))

(assert (= (and b!308703 res!253243) b!308701))

(assert (= (and b!308701 (not res!253239)) b!308699))

(assert (= (and b!308701 res!253238) b!308698))

(assert (= (and b!308698 res!253241) b!308705))

(assert (= (and b!308705 (not res!253247)) b!308704))

(assert (= (and b!308704 (not res!253242)) b!308694))

(assert (= (and b!308694 res!253246) b!308697))

(assert (= (and b!308694 (not res!253240)) b!308696))

(assert (= (and b!308693 condMapEmpty!2747) mapIsEmpty!2747))

(assert (= (and b!308693 (not condMapEmpty!2747)) mapNonEmpty!2747))

(assert (= start!68580 b!308693))

(assert (= (and b!308695 condMapEmpty!2748) mapIsEmpty!2748))

(assert (= (and b!308695 (not condMapEmpty!2748)) mapNonEmpty!2748))

(assert (= start!68580 b!308695))

(declare-fun m!446917 () Bool)

(assert (=> b!308705 m!446917))

(declare-fun m!446919 () Bool)

(assert (=> b!308705 m!446919))

(declare-fun m!446921 () Bool)

(assert (=> b!308705 m!446921))

(declare-fun m!446923 () Bool)

(assert (=> b!308704 m!446923))

(declare-fun m!446925 () Bool)

(assert (=> b!308696 m!446925))

(declare-fun m!446927 () Bool)

(assert (=> b!308696 m!446927))

(declare-fun m!446929 () Bool)

(assert (=> b!308703 m!446929))

(declare-fun m!446931 () Bool)

(assert (=> b!308700 m!446931))

(declare-fun m!446933 () Bool)

(assert (=> b!308697 m!446933))

(declare-fun m!446935 () Bool)

(assert (=> mapNonEmpty!2747 m!446935))

(declare-fun m!446937 () Bool)

(assert (=> mapNonEmpty!2748 m!446937))

(declare-fun m!446939 () Bool)

(assert (=> b!308699 m!446939))

(declare-fun m!446941 () Bool)

(assert (=> start!68580 m!446941))

(declare-fun m!446943 () Bool)

(assert (=> start!68580 m!446943))

(check-sat (not mapNonEmpty!2747) (not start!68580) (not b!308704) (not b!308703) tp_is_empty!861 (not mapNonEmpty!2748) (not b!308697) (not b!308700) (not b!308696) (not b!308699) (not b!308705))
(check-sat)

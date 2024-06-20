; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68574 () Bool)

(assert start!68574)

(declare-fun mapIsEmpty!2729 () Bool)

(declare-fun mapRes!2730 () Bool)

(assert (=> mapIsEmpty!2729 mapRes!2730))

(declare-fun mapIsEmpty!2730 () Bool)

(declare-fun mapRes!2729 () Bool)

(assert (=> mapIsEmpty!2730 mapRes!2729))

(declare-fun b!308576 () Bool)

(declare-fun res!253142 () Bool)

(declare-fun e!222118 () Bool)

(assert (=> b!308576 (=> res!253142 e!222118)))

(declare-fun e!222115 () Bool)

(assert (=> b!308576 (= res!253142 e!222115)))

(declare-fun res!253139 () Bool)

(assert (=> b!308576 (=> (not res!253139) (not e!222115))))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!308576 (= res!253139 (bvsle (bvsub i!932 #b00000000000000000000000000000001) toSlice!46))))

(declare-fun b!308577 () Bool)

(declare-fun e!222119 () Bool)

(assert (=> b!308577 (= e!222119 (not e!222118))))

(declare-fun res!253145 () Bool)

(assert (=> b!308577 (=> res!253145 e!222118)))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(assert (=> b!308577 (= res!253145 (or (bvsgt fromSlice!46 (bvsub i!932 #b00000000000000000000000000000001)) (bvsgt (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-datatypes ((T!57901 0))(
  ( (T!57902 (val!427 Int)) )
))
(declare-datatypes ((array!18719 0))(
  ( (array!18720 (arr!9197 (Array (_ BitVec 32) T!57901)) (size!8114 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18719)

(declare-fun a2!524 () array!18719)

(assert (=> b!308577 (= (select (arr!9197 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9197 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-fun from!650 () (_ BitVec 32))

(declare-datatypes ((Unit!21467 0))(
  ( (Unit!21468) )
))
(declare-fun lt!440325 () Unit!21467)

(declare-fun arrayRangesEqImpliesEq!305 (array!18719 array!18719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21467)

(assert (=> b!308577 (= lt!440325 (arrayRangesEqImpliesEq!305 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun res!253144 () Bool)

(assert (=> start!68574 (=> (not res!253144) (not e!222119))))

(assert (=> start!68574 (= res!253144 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8114 a1!524) (size!8114 a2!524)) (bvsle to!617 (size!8114 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68574 e!222119))

(assert (=> start!68574 true))

(declare-fun e!222116 () Bool)

(declare-fun array_inv!7705 (array!18719) Bool)

(assert (=> start!68574 (and (array_inv!7705 a2!524) e!222116)))

(declare-fun e!222117 () Bool)

(assert (=> start!68574 (and (array_inv!7705 a1!524) e!222117)))

(declare-fun e!222120 () Bool)

(declare-fun b!308578 () Bool)

(declare-fun arrayRangesEq!1730 (array!18719 array!18719 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308578 (= e!222120 (arrayRangesEq!1730 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!308579 () Bool)

(declare-fun res!253138 () Bool)

(assert (=> b!308579 (=> (not res!253138) (not e!222119))))

(assert (=> b!308579 (= res!253138 (arrayRangesEq!1730 a1!524 a2!524 i!932 to!617))))

(declare-fun mapNonEmpty!2729 () Bool)

(declare-fun tp!2729 () Bool)

(declare-fun tp_is_empty!855 () Bool)

(assert (=> mapNonEmpty!2729 (= mapRes!2730 (and tp!2729 tp_is_empty!855))))

(declare-fun mapRest!2729 () (Array (_ BitVec 32) T!57901))

(declare-fun mapKey!2729 () (_ BitVec 32))

(declare-fun mapValue!2730 () T!57901)

(assert (=> mapNonEmpty!2729 (= (arr!9197 a1!524) (store mapRest!2729 mapKey!2729 mapValue!2730))))

(declare-fun b!308580 () Bool)

(declare-fun res!253143 () Bool)

(assert (=> b!308580 (=> (not res!253143) (not e!222119))))

(assert (=> b!308580 (= res!253143 (arrayRangesEq!1730 a1!524 a2!524 from!650 to!617))))

(declare-fun b!308581 () Bool)

(declare-fun res!253147 () Bool)

(assert (=> b!308581 (=> (not res!253147) (not e!222119))))

(assert (=> b!308581 (= res!253147 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun mapNonEmpty!2730 () Bool)

(declare-fun tp!2730 () Bool)

(assert (=> mapNonEmpty!2730 (= mapRes!2729 (and tp!2730 tp_is_empty!855))))

(declare-fun mapRest!2730 () (Array (_ BitVec 32) T!57901))

(declare-fun mapKey!2730 () (_ BitVec 32))

(declare-fun mapValue!2729 () T!57901)

(assert (=> mapNonEmpty!2730 (= (arr!9197 a2!524) (store mapRest!2730 mapKey!2730 mapValue!2729))))

(declare-fun b!308582 () Bool)

(declare-fun res!253148 () Bool)

(assert (=> b!308582 (=> (not res!253148) (not e!222119))))

(assert (=> b!308582 (= res!253148 (not (= i!932 fromSlice!46)))))

(declare-fun b!308583 () Bool)

(assert (=> b!308583 (= e!222118 true)))

(assert (=> b!308583 (arrayRangesEq!1730 a1!524 a2!524 fromSlice!46 toSlice!46)))

(declare-fun lt!440324 () Unit!21467)

(declare-fun rec!98 (array!18719 array!18719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21467)

(assert (=> b!308583 (= lt!440324 (rec!98 a1!524 a2!524 from!650 fromSlice!46 to!617 toSlice!46 (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-fun b!308584 () Bool)

(declare-fun res!253140 () Bool)

(assert (=> b!308584 (=> res!253140 e!222118)))

(assert (=> b!308584 (= res!253140 (not (arrayRangesEq!1730 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-fun b!308585 () Bool)

(assert (=> b!308585 (= e!222117 (and tp_is_empty!855 mapRes!2730))))

(declare-fun condMapEmpty!2729 () Bool)

(declare-fun mapDefault!2730 () T!57901)

(assert (=> b!308585 (= condMapEmpty!2729 (= (arr!9197 a1!524) ((as const (Array (_ BitVec 32) T!57901)) mapDefault!2730)))))

(declare-fun b!308586 () Bool)

(declare-fun res!253146 () Bool)

(assert (=> b!308586 (=> (not res!253146) (not e!222119))))

(assert (=> b!308586 (= res!253146 e!222120)))

(declare-fun res!253141 () Bool)

(assert (=> b!308586 (=> res!253141 e!222120)))

(assert (=> b!308586 (= res!253141 (bvsgt i!932 toSlice!46))))

(declare-fun b!308587 () Bool)

(assert (=> b!308587 (= e!222116 (and tp_is_empty!855 mapRes!2729))))

(declare-fun condMapEmpty!2730 () Bool)

(declare-fun mapDefault!2729 () T!57901)

(assert (=> b!308587 (= condMapEmpty!2730 (= (arr!9197 a2!524) ((as const (Array (_ BitVec 32) T!57901)) mapDefault!2729)))))

(declare-fun b!308588 () Bool)

(assert (=> b!308588 (= e!222115 (not (arrayRangesEq!1730 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) toSlice!46)))))

(assert (= (and start!68574 res!253144) b!308580))

(assert (= (and b!308580 res!253143) b!308581))

(assert (= (and b!308581 res!253147) b!308579))

(assert (= (and b!308579 res!253138) b!308586))

(assert (= (and b!308586 (not res!253141)) b!308578))

(assert (= (and b!308586 res!253146) b!308582))

(assert (= (and b!308582 res!253148) b!308577))

(assert (= (and b!308577 (not res!253145)) b!308584))

(assert (= (and b!308584 (not res!253140)) b!308576))

(assert (= (and b!308576 res!253139) b!308588))

(assert (= (and b!308576 (not res!253142)) b!308583))

(assert (= (and b!308587 condMapEmpty!2730) mapIsEmpty!2730))

(assert (= (and b!308587 (not condMapEmpty!2730)) mapNonEmpty!2730))

(assert (= start!68574 b!308587))

(assert (= (and b!308585 condMapEmpty!2729) mapIsEmpty!2729))

(assert (= (and b!308585 (not condMapEmpty!2729)) mapNonEmpty!2729))

(assert (= start!68574 b!308585))

(declare-fun m!446833 () Bool)

(assert (=> mapNonEmpty!2730 m!446833))

(declare-fun m!446835 () Bool)

(assert (=> b!308579 m!446835))

(declare-fun m!446837 () Bool)

(assert (=> mapNonEmpty!2729 m!446837))

(declare-fun m!446839 () Bool)

(assert (=> b!308588 m!446839))

(declare-fun m!446841 () Bool)

(assert (=> b!308580 m!446841))

(declare-fun m!446843 () Bool)

(assert (=> b!308578 m!446843))

(declare-fun m!446845 () Bool)

(assert (=> b!308583 m!446845))

(declare-fun m!446847 () Bool)

(assert (=> b!308583 m!446847))

(declare-fun m!446849 () Bool)

(assert (=> start!68574 m!446849))

(declare-fun m!446851 () Bool)

(assert (=> start!68574 m!446851))

(declare-fun m!446853 () Bool)

(assert (=> b!308584 m!446853))

(declare-fun m!446855 () Bool)

(assert (=> b!308577 m!446855))

(declare-fun m!446857 () Bool)

(assert (=> b!308577 m!446857))

(declare-fun m!446859 () Bool)

(assert (=> b!308577 m!446859))

(check-sat (not mapNonEmpty!2729) tp_is_empty!855 (not b!308577) (not b!308588) (not b!308583) (not b!308584) (not start!68574) (not b!308580) (not b!308578) (not b!308579) (not mapNonEmpty!2730))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68682 () Bool)

(assert start!68682)

(declare-fun b!309840 () Bool)

(declare-fun res!254110 () Bool)

(declare-fun e!222758 () Bool)

(assert (=> b!309840 (=> (not res!254110) (not e!222758))))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun from!692 () (_ BitVec 32))

(assert (=> b!309840 (= res!254110 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun mapNonEmpty!3025 () Bool)

(declare-fun mapRes!3026 () Bool)

(declare-fun tp!3026 () Bool)

(declare-fun tp_is_empty!951 () Bool)

(assert (=> mapNonEmpty!3025 (= mapRes!3026 (and tp!3026 tp_is_empty!951))))

(declare-datatypes ((T!58317 0))(
  ( (T!58318 (val!475 Int)) )
))
(declare-fun mapRest!3026 () (Array (_ BitVec 32) T!58317))

(declare-fun mapValue!3026 () T!58317)

(declare-fun mapKey!3025 () (_ BitVec 32))

(declare-datatypes ((array!18817 0))(
  ( (array!18818 (arr!9245 (Array (_ BitVec 32) T!58317)) (size!8162 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18817)

(assert (=> mapNonEmpty!3025 (= (arr!9245 a2!566) (store mapRest!3026 mapKey!3025 mapValue!3026))))

(declare-fun b!309841 () Bool)

(declare-fun to!659 () (_ BitVec 32))

(assert (=> b!309841 (= e!222758 (and (not (= (bvand to!659 #b10000000000000000000000000000000) (bvand i!943 #b10000000000000000000000000000000))) (not (= (bvand to!659 #b10000000000000000000000000000000) (bvand (bvsub to!659 i!943) #b10000000000000000000000000000000)))))))

(declare-fun b!309842 () Bool)

(declare-fun res!254113 () Bool)

(assert (=> b!309842 (=> (not res!254113) (not e!222758))))

(declare-fun a1!566 () array!18817)

(declare-fun arrayRangesEq!1767 (array!18817 array!18817 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309842 (= res!254113 (arrayRangesEq!1767 a1!566 a2!566 from!692 to!659))))

(declare-fun mapIsEmpty!3025 () Bool)

(assert (=> mapIsEmpty!3025 mapRes!3026))

(declare-fun mapIsEmpty!3026 () Bool)

(declare-fun mapRes!3025 () Bool)

(assert (=> mapIsEmpty!3026 mapRes!3025))

(declare-fun b!309844 () Bool)

(declare-fun e!222757 () Bool)

(assert (=> b!309844 (= e!222757 (and tp_is_empty!951 mapRes!3025))))

(declare-fun condMapEmpty!3025 () Bool)

(declare-fun mapDefault!3025 () T!58317)

(assert (=> b!309844 (= condMapEmpty!3025 (= (arr!9245 a1!566) ((as const (Array (_ BitVec 32) T!58317)) mapDefault!3025)))))

(declare-fun mapNonEmpty!3026 () Bool)

(declare-fun tp!3025 () Bool)

(assert (=> mapNonEmpty!3026 (= mapRes!3025 (and tp!3025 tp_is_empty!951))))

(declare-fun mapValue!3025 () T!58317)

(declare-fun mapKey!3026 () (_ BitVec 32))

(declare-fun mapRest!3025 () (Array (_ BitVec 32) T!58317))

(assert (=> mapNonEmpty!3026 (= (arr!9245 a1!566) (store mapRest!3025 mapKey!3026 mapValue!3025))))

(declare-fun b!309845 () Bool)

(declare-fun res!254112 () Bool)

(assert (=> b!309845 (=> (not res!254112) (not e!222758))))

(assert (=> b!309845 (= res!254112 (arrayRangesEq!1767 a1!566 a2!566 i!943 to!659))))

(declare-fun b!309843 () Bool)

(declare-fun e!222756 () Bool)

(assert (=> b!309843 (= e!222756 (and tp_is_empty!951 mapRes!3026))))

(declare-fun condMapEmpty!3026 () Bool)

(declare-fun mapDefault!3026 () T!58317)

(assert (=> b!309843 (= condMapEmpty!3026 (= (arr!9245 a2!566) ((as const (Array (_ BitVec 32) T!58317)) mapDefault!3026)))))

(declare-fun res!254111 () Bool)

(assert (=> start!68682 (=> (not res!254111) (not e!222758))))

(assert (=> start!68682 (= res!254111 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8162 a1!566) (size!8162 a2!566)) (bvsle to!659 (size!8162 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68682 e!222758))

(assert (=> start!68682 true))

(declare-fun array_inv!7732 (array!18817) Bool)

(assert (=> start!68682 (and (array_inv!7732 a2!566) e!222756)))

(assert (=> start!68682 (and (array_inv!7732 a1!566) e!222757)))

(assert (= (and start!68682 res!254111) b!309842))

(assert (= (and b!309842 res!254113) b!309840))

(assert (= (and b!309840 res!254110) b!309845))

(assert (= (and b!309845 res!254112) b!309841))

(assert (= (and b!309843 condMapEmpty!3026) mapIsEmpty!3025))

(assert (= (and b!309843 (not condMapEmpty!3026)) mapNonEmpty!3025))

(assert (= start!68682 b!309843))

(assert (= (and b!309844 condMapEmpty!3025) mapIsEmpty!3026))

(assert (= (and b!309844 (not condMapEmpty!3025)) mapNonEmpty!3026))

(assert (= start!68682 b!309844))

(declare-fun m!447793 () Bool)

(assert (=> mapNonEmpty!3025 m!447793))

(declare-fun m!447795 () Bool)

(assert (=> mapNonEmpty!3026 m!447795))

(declare-fun m!447797 () Bool)

(assert (=> b!309842 m!447797))

(declare-fun m!447799 () Bool)

(assert (=> b!309845 m!447799))

(declare-fun m!447801 () Bool)

(assert (=> start!68682 m!447801))

(declare-fun m!447803 () Bool)

(assert (=> start!68682 m!447803))

(check-sat (not b!309842) (not b!309845) (not mapNonEmpty!3026) (not mapNonEmpty!3025) tp_is_empty!951 (not start!68682))
(check-sat)

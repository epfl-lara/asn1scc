; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68658 () Bool)

(assert start!68658)

(declare-fun b!309686 () Bool)

(declare-fun e!222648 () Bool)

(declare-fun tp_is_empty!927 () Bool)

(declare-fun mapRes!2953 () Bool)

(assert (=> b!309686 (= e!222648 (and tp_is_empty!927 mapRes!2953))))

(declare-fun condMapEmpty!2954 () Bool)

(declare-datatypes ((T!58213 0))(
  ( (T!58214 (val!463 Int)) )
))
(declare-datatypes ((array!18793 0))(
  ( (array!18794 (arr!9233 (Array (_ BitVec 32) T!58213)) (size!8150 (_ BitVec 32))) )
))
(declare-fun a1!555 () array!18793)

(declare-fun mapDefault!2953 () T!58213)

(assert (=> b!309686 (= condMapEmpty!2954 (= (arr!9233 a1!555) ((as const (Array (_ BitVec 32) T!58213)) mapDefault!2953)))))

(declare-fun mapNonEmpty!2953 () Bool)

(declare-fun mapRes!2954 () Bool)

(declare-fun tp!2953 () Bool)

(assert (=> mapNonEmpty!2953 (= mapRes!2954 (and tp!2953 tp_is_empty!927))))

(declare-fun a2!555 () array!18793)

(declare-fun mapRest!2953 () (Array (_ BitVec 32) T!58213))

(declare-fun mapKey!2953 () (_ BitVec 32))

(declare-fun mapValue!2954 () T!58213)

(assert (=> mapNonEmpty!2953 (= (arr!9233 a2!555) (store mapRest!2953 mapKey!2953 mapValue!2954))))

(declare-fun mapIsEmpty!2953 () Bool)

(assert (=> mapIsEmpty!2953 mapRes!2954))

(declare-fun mapNonEmpty!2954 () Bool)

(declare-fun tp!2954 () Bool)

(assert (=> mapNonEmpty!2954 (= mapRes!2953 (and tp!2954 tp_is_empty!927))))

(declare-fun mapKey!2954 () (_ BitVec 32))

(declare-fun mapRest!2954 () (Array (_ BitVec 32) T!58213))

(declare-fun mapValue!2953 () T!58213)

(assert (=> mapNonEmpty!2954 (= (arr!9233 a1!555) (store mapRest!2954 mapKey!2954 mapValue!2953))))

(declare-fun b!309687 () Bool)

(declare-fun res!254028 () Bool)

(declare-fun e!222650 () Bool)

(assert (=> b!309687 (=> (not res!254028) (not e!222650))))

(declare-fun from!681 () (_ BitVec 32))

(declare-fun to!648 () (_ BitVec 32))

(declare-fun arrayRangesEq!1761 (array!18793 array!18793 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309687 (= res!254028 (arrayRangesEq!1761 a1!555 a2!555 from!681 to!648))))

(declare-fun b!309688 () Bool)

(declare-fun e!222649 () Bool)

(assert (=> b!309688 (= e!222649 (and tp_is_empty!927 mapRes!2954))))

(declare-fun condMapEmpty!2953 () Bool)

(declare-fun mapDefault!2954 () T!58213)

(assert (=> b!309688 (= condMapEmpty!2953 (= (arr!9233 a2!555) ((as const (Array (_ BitVec 32) T!58213)) mapDefault!2954)))))

(declare-fun mapIsEmpty!2954 () Bool)

(assert (=> mapIsEmpty!2954 mapRes!2953))

(declare-fun res!254029 () Bool)

(assert (=> start!68658 (=> (not res!254029) (not e!222650))))

(declare-fun at!230 () (_ BitVec 32))

(assert (=> start!68658 (= res!254029 (and (bvsle #b00000000000000000000000000000000 from!681) (bvsle from!681 to!648) (bvsle (size!8150 a1!555) (size!8150 a2!555)) (bvsle to!648 (size!8150 a1!555)) (bvsle from!681 at!230) (bvslt at!230 to!648)))))

(assert (=> start!68658 e!222650))

(declare-fun array_inv!7726 (array!18793) Bool)

(assert (=> start!68658 (and (array_inv!7726 a2!555) e!222649)))

(assert (=> start!68658 (and (array_inv!7726 a1!555) e!222648)))

(assert (=> start!68658 true))

(declare-fun b!309689 () Bool)

(assert (=> b!309689 (= e!222650 (not (and (bvsge at!230 #b00000000000000000000000000000000) (bvslt at!230 (size!8150 a1!555)))))))

(assert (=> b!309689 (= (select (arr!9233 a1!555) at!230) (select (arr!9233 a2!555) at!230))))

(declare-datatypes ((Unit!21491 0))(
  ( (Unit!21492) )
))
(declare-fun lt!440424 () Unit!21491)

(declare-fun rec!103 (array!18793 array!18793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21491)

(assert (=> b!309689 (= lt!440424 (rec!103 a1!555 a2!555 at!230 from!681 to!648 from!681))))

(assert (= (and start!68658 res!254029) b!309687))

(assert (= (and b!309687 res!254028) b!309689))

(assert (= (and b!309688 condMapEmpty!2953) mapIsEmpty!2953))

(assert (= (and b!309688 (not condMapEmpty!2953)) mapNonEmpty!2953))

(assert (= start!68658 b!309688))

(assert (= (and b!309686 condMapEmpty!2954) mapIsEmpty!2954))

(assert (= (and b!309686 (not condMapEmpty!2954)) mapNonEmpty!2954))

(assert (= start!68658 b!309686))

(declare-fun m!447623 () Bool)

(assert (=> b!309687 m!447623))

(declare-fun m!447625 () Bool)

(assert (=> mapNonEmpty!2953 m!447625))

(declare-fun m!447627 () Bool)

(assert (=> b!309689 m!447627))

(declare-fun m!447629 () Bool)

(assert (=> b!309689 m!447629))

(declare-fun m!447631 () Bool)

(assert (=> b!309689 m!447631))

(declare-fun m!447633 () Bool)

(assert (=> mapNonEmpty!2954 m!447633))

(declare-fun m!447635 () Bool)

(assert (=> start!68658 m!447635))

(declare-fun m!447637 () Bool)

(assert (=> start!68658 m!447637))

(check-sat (not b!309687) (not b!309689) (not start!68658) (not mapNonEmpty!2954) (not mapNonEmpty!2953) tp_is_empty!927)
(check-sat)

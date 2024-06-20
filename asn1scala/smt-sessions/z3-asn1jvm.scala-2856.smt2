; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68664 () Bool)

(assert start!68664)

(declare-fun mapIsEmpty!2971 () Bool)

(declare-fun mapRes!2972 () Bool)

(assert (=> mapIsEmpty!2971 mapRes!2972))

(declare-fun mapIsEmpty!2972 () Bool)

(declare-fun mapRes!2971 () Bool)

(assert (=> mapIsEmpty!2972 mapRes!2971))

(declare-fun b!309722 () Bool)

(declare-fun res!254047 () Bool)

(declare-fun e!222676 () Bool)

(assert (=> b!309722 (=> (not res!254047) (not e!222676))))

(declare-datatypes ((T!58239 0))(
  ( (T!58240 (val!466 Int)) )
))
(declare-datatypes ((array!18799 0))(
  ( (array!18800 (arr!9236 (Array (_ BitVec 32) T!58239)) (size!8153 (_ BitVec 32))) )
))
(declare-fun a2!555 () array!18799)

(declare-fun a1!555 () array!18799)

(declare-fun from!681 () (_ BitVec 32))

(declare-fun to!648 () (_ BitVec 32))

(declare-fun arrayRangesEq!1762 (array!18799 array!18799 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309722 (= res!254047 (arrayRangesEq!1762 a1!555 a2!555 from!681 to!648))))

(declare-fun b!309723 () Bool)

(declare-fun e!222677 () Bool)

(declare-fun tp_is_empty!933 () Bool)

(assert (=> b!309723 (= e!222677 (and tp_is_empty!933 mapRes!2971))))

(declare-fun condMapEmpty!2972 () Bool)

(declare-fun mapDefault!2971 () T!58239)

(assert (=> b!309723 (= condMapEmpty!2972 (= (arr!9236 a2!555) ((as const (Array (_ BitVec 32) T!58239)) mapDefault!2971)))))

(declare-fun mapNonEmpty!2971 () Bool)

(declare-fun tp!2971 () Bool)

(assert (=> mapNonEmpty!2971 (= mapRes!2972 (and tp!2971 tp_is_empty!933))))

(declare-fun mapRest!2972 () (Array (_ BitVec 32) T!58239))

(declare-fun mapValue!2971 () T!58239)

(declare-fun mapKey!2972 () (_ BitVec 32))

(assert (=> mapNonEmpty!2971 (= (arr!9236 a1!555) (store mapRest!2972 mapKey!2972 mapValue!2971))))

(declare-fun b!309724 () Bool)

(declare-fun at!230 () (_ BitVec 32))

(assert (=> b!309724 (= e!222676 (not (and (bvsge at!230 #b00000000000000000000000000000000) (bvslt at!230 (size!8153 a2!555)))))))

(assert (=> b!309724 (= (select (arr!9236 a1!555) at!230) (select (arr!9236 a2!555) at!230))))

(declare-datatypes ((Unit!21493 0))(
  ( (Unit!21494) )
))
(declare-fun lt!440433 () Unit!21493)

(declare-fun rec!104 (array!18799 array!18799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21493)

(assert (=> b!309724 (= lt!440433 (rec!104 a1!555 a2!555 at!230 from!681 to!648 from!681))))

(declare-fun b!309725 () Bool)

(declare-fun e!222675 () Bool)

(assert (=> b!309725 (= e!222675 (and tp_is_empty!933 mapRes!2972))))

(declare-fun condMapEmpty!2971 () Bool)

(declare-fun mapDefault!2972 () T!58239)

(assert (=> b!309725 (= condMapEmpty!2971 (= (arr!9236 a1!555) ((as const (Array (_ BitVec 32) T!58239)) mapDefault!2972)))))

(declare-fun mapNonEmpty!2972 () Bool)

(declare-fun tp!2972 () Bool)

(assert (=> mapNonEmpty!2972 (= mapRes!2971 (and tp!2972 tp_is_empty!933))))

(declare-fun mapRest!2971 () (Array (_ BitVec 32) T!58239))

(declare-fun mapKey!2971 () (_ BitVec 32))

(declare-fun mapValue!2972 () T!58239)

(assert (=> mapNonEmpty!2972 (= (arr!9236 a2!555) (store mapRest!2971 mapKey!2971 mapValue!2972))))

(declare-fun res!254046 () Bool)

(assert (=> start!68664 (=> (not res!254046) (not e!222676))))

(assert (=> start!68664 (= res!254046 (and (bvsle #b00000000000000000000000000000000 from!681) (bvsle from!681 to!648) (bvsle (size!8153 a1!555) (size!8153 a2!555)) (bvsle to!648 (size!8153 a1!555)) (bvsle from!681 at!230) (bvslt at!230 to!648)))))

(assert (=> start!68664 e!222676))

(declare-fun array_inv!7727 (array!18799) Bool)

(assert (=> start!68664 (and (array_inv!7727 a2!555) e!222677)))

(assert (=> start!68664 (and (array_inv!7727 a1!555) e!222675)))

(assert (=> start!68664 true))

(assert (= (and start!68664 res!254046) b!309722))

(assert (= (and b!309722 res!254047) b!309724))

(assert (= (and b!309723 condMapEmpty!2972) mapIsEmpty!2972))

(assert (= (and b!309723 (not condMapEmpty!2972)) mapNonEmpty!2972))

(assert (= start!68664 b!309723))

(assert (= (and b!309725 condMapEmpty!2971) mapIsEmpty!2971))

(assert (= (and b!309725 (not condMapEmpty!2971)) mapNonEmpty!2971))

(assert (= start!68664 b!309725))

(declare-fun m!447671 () Bool)

(assert (=> mapNonEmpty!2972 m!447671))

(declare-fun m!447673 () Bool)

(assert (=> start!68664 m!447673))

(declare-fun m!447675 () Bool)

(assert (=> start!68664 m!447675))

(declare-fun m!447677 () Bool)

(assert (=> b!309724 m!447677))

(declare-fun m!447679 () Bool)

(assert (=> b!309724 m!447679))

(declare-fun m!447681 () Bool)

(assert (=> b!309724 m!447681))

(declare-fun m!447683 () Bool)

(assert (=> b!309722 m!447683))

(declare-fun m!447685 () Bool)

(assert (=> mapNonEmpty!2971 m!447685))

(check-sat tp_is_empty!933 (not b!309722) (not b!309724) (not mapNonEmpty!2971) (not start!68664) (not mapNonEmpty!2972))
(check-sat)

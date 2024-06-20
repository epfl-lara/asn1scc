; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68720 () Bool)

(assert start!68720)

(declare-fun b!310156 () Bool)

(declare-fun res!254324 () Bool)

(declare-fun e!222917 () Bool)

(assert (=> b!310156 (=> (not res!254324) (not e!222917))))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun from!692 () (_ BitVec 32))

(assert (=> b!310156 (= res!254324 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun b!310157 () Bool)

(declare-fun res!254325 () Bool)

(assert (=> b!310157 (=> (not res!254325) (not e!222917))))

(declare-fun to!659 () (_ BitVec 32))

(declare-datatypes ((T!58471 0))(
  ( (T!58472 (val!492 Int)) )
))
(declare-datatypes ((array!18852 0))(
  ( (array!18853 (arr!9262 (Array (_ BitVec 32) T!58471)) (size!8179 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18852)

(declare-fun a1!566 () array!18852)

(declare-fun arrayRangesEq!1777 (array!18852 array!18852 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310157 (= res!254325 (arrayRangesEq!1777 a1!566 a2!566 from!692 to!659))))

(declare-fun mapIsEmpty!3131 () Bool)

(declare-fun mapRes!3132 () Bool)

(assert (=> mapIsEmpty!3131 mapRes!3132))

(declare-fun res!254323 () Bool)

(assert (=> start!68720 (=> (not res!254323) (not e!222917))))

(assert (=> start!68720 (= res!254323 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8179 a1!566) (size!8179 a2!566)) (bvsle to!659 (size!8179 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68720 e!222917))

(assert (=> start!68720 true))

(declare-fun e!222918 () Bool)

(declare-fun array_inv!7744 (array!18852) Bool)

(assert (=> start!68720 (and (array_inv!7744 a2!566) e!222918)))

(declare-fun e!222919 () Bool)

(assert (=> start!68720 (and (array_inv!7744 a1!566) e!222919)))

(declare-fun mapNonEmpty!3131 () Bool)

(declare-fun mapRes!3131 () Bool)

(declare-fun tp!3131 () Bool)

(declare-fun tp_is_empty!985 () Bool)

(assert (=> mapNonEmpty!3131 (= mapRes!3131 (and tp!3131 tp_is_empty!985))))

(declare-fun mapRest!3132 () (Array (_ BitVec 32) T!58471))

(declare-fun mapValue!3132 () T!58471)

(declare-fun mapKey!3132 () (_ BitVec 32))

(assert (=> mapNonEmpty!3131 (= (arr!9262 a2!566) (store mapRest!3132 mapKey!3132 mapValue!3132))))

(declare-fun b!310158 () Bool)

(declare-fun res!254322 () Bool)

(assert (=> b!310158 (=> (not res!254322) (not e!222917))))

(assert (=> b!310158 (= res!254322 (arrayRangesEq!1777 a1!566 a2!566 i!943 to!659))))

(declare-fun b!310159 () Bool)

(assert (=> b!310159 (= e!222919 (and tp_is_empty!985 mapRes!3132))))

(declare-fun condMapEmpty!3132 () Bool)

(declare-fun mapDefault!3131 () T!58471)


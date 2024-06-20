; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68696 () Bool)

(assert start!68696)

(declare-fun b!309966 () Bool)

(declare-fun res!254194 () Bool)

(declare-fun e!222821 () Bool)

(assert (=> b!309966 (=> (not res!254194) (not e!222821))))

(declare-fun i!943 () (_ BitVec 32))

(declare-datatypes ((T!58371 0))(
  ( (T!58372 (val!482 Int)) )
))
(declare-datatypes ((array!18831 0))(
  ( (array!18832 (arr!9252 (Array (_ BitVec 32) T!58371)) (size!8169 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18831)

(declare-fun to!659 () (_ BitVec 32))

(declare-fun a2!566 () array!18831)

(declare-fun arrayRangesEq!1772 (array!18831 array!18831 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309966 (= res!254194 (arrayRangesEq!1772 a1!566 a2!566 i!943 to!659))))

(declare-fun res!254197 () Bool)

(assert (=> start!68696 (=> (not res!254197) (not e!222821))))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun from!692 () (_ BitVec 32))

(assert (=> start!68696 (= res!254197 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8169 a1!566) (size!8169 a2!566)) (bvsle to!659 (size!8169 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68696 e!222821))

(assert (=> start!68696 true))

(declare-fun e!222819 () Bool)

(declare-fun array_inv!7737 (array!18831) Bool)

(assert (=> start!68696 (and (array_inv!7737 a2!566) e!222819)))

(declare-fun e!222820 () Bool)

(assert (=> start!68696 (and (array_inv!7737 a1!566) e!222820)))

(declare-fun mapNonEmpty!3067 () Bool)

(declare-fun mapRes!3068 () Bool)

(declare-fun tp!3068 () Bool)

(declare-fun tp_is_empty!965 () Bool)

(assert (=> mapNonEmpty!3067 (= mapRes!3068 (and tp!3068 tp_is_empty!965))))

(declare-fun mapValue!3068 () T!58371)

(declare-fun mapRest!3068 () (Array (_ BitVec 32) T!58371))

(declare-fun mapKey!3067 () (_ BitVec 32))

(assert (=> mapNonEmpty!3067 (= (arr!9252 a2!566) (store mapRest!3068 mapKey!3067 mapValue!3068))))

(declare-fun b!309967 () Bool)

(assert (=> b!309967 (= e!222819 (and tp_is_empty!965 mapRes!3068))))

(declare-fun condMapEmpty!3068 () Bool)

(declare-fun mapDefault!3068 () T!58371)


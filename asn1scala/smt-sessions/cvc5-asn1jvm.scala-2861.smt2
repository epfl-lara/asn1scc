; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68692 () Bool)

(assert start!68692)

(declare-fun mapIsEmpty!3055 () Bool)

(declare-fun mapRes!3056 () Bool)

(assert (=> mapIsEmpty!3055 mapRes!3056))

(declare-fun mapNonEmpty!3055 () Bool)

(declare-fun tp!3055 () Bool)

(declare-fun tp_is_empty!961 () Bool)

(assert (=> mapNonEmpty!3055 (= mapRes!3056 (and tp!3055 tp_is_empty!961))))

(declare-datatypes ((T!58367 0))(
  ( (T!58368 (val!480 Int)) )
))
(declare-fun mapValue!3055 () T!58367)

(declare-datatypes ((array!18827 0))(
  ( (array!18828 (arr!9250 (Array (_ BitVec 32) T!58367)) (size!8167 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18827)

(declare-fun mapRest!3056 () (Array (_ BitVec 32) T!58367))

(declare-fun mapKey!3055 () (_ BitVec 32))

(assert (=> mapNonEmpty!3055 (= (arr!9250 a1!566) (store mapRest!3056 mapKey!3055 mapValue!3055))))

(declare-fun b!309930 () Bool)

(declare-fun res!254170 () Bool)

(declare-fun e!222802 () Bool)

(assert (=> b!309930 (=> (not res!254170) (not e!222802))))

(declare-fun to!659 () (_ BitVec 32))

(declare-fun a2!566 () array!18827)

(declare-fun from!692 () (_ BitVec 32))

(declare-fun arrayRangesEq!1770 (array!18827 array!18827 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309930 (= res!254170 (arrayRangesEq!1770 a1!566 a2!566 from!692 to!659))))

(declare-fun res!254172 () Bool)

(assert (=> start!68692 (=> (not res!254172) (not e!222802))))

(declare-fun at!235 () (_ BitVec 32))

(assert (=> start!68692 (= res!254172 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8167 a1!566) (size!8167 a2!566)) (bvsle to!659 (size!8167 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68692 e!222802))

(assert (=> start!68692 true))

(declare-fun e!222803 () Bool)

(declare-fun array_inv!7735 (array!18827) Bool)

(assert (=> start!68692 (and (array_inv!7735 a2!566) e!222803)))

(declare-fun e!222801 () Bool)

(assert (=> start!68692 (and (array_inv!7735 a1!566) e!222801)))

(declare-fun b!309931 () Bool)

(declare-fun res!254171 () Bool)

(assert (=> b!309931 (=> (not res!254171) (not e!222802))))

(declare-fun i!943 () (_ BitVec 32))

(assert (=> b!309931 (= res!254171 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun b!309932 () Bool)

(declare-fun mapRes!3055 () Bool)

(assert (=> b!309932 (= e!222803 (and tp_is_empty!961 mapRes!3055))))

(declare-fun condMapEmpty!3056 () Bool)

(declare-fun mapDefault!3055 () T!58367)


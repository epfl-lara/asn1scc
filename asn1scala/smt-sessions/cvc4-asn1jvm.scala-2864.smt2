; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68718 () Bool)

(assert start!68718)

(declare-fun res!254313 () Bool)

(declare-fun e!222908 () Bool)

(assert (=> start!68718 (=> (not res!254313) (not e!222908))))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun to!659 () (_ BitVec 32))

(declare-datatypes ((T!58449 0))(
  ( (T!58450 (val!491 Int)) )
))
(declare-datatypes ((array!18850 0))(
  ( (array!18851 (arr!9261 (Array (_ BitVec 32) T!58449)) (size!8178 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18850)

(declare-fun from!692 () (_ BitVec 32))

(declare-fun a2!566 () array!18850)

(assert (=> start!68718 (= res!254313 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8178 a1!566) (size!8178 a2!566)) (bvsle to!659 (size!8178 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68718 e!222908))

(assert (=> start!68718 true))

(declare-fun e!222910 () Bool)

(declare-fun array_inv!7743 (array!18850) Bool)

(assert (=> start!68718 (and (array_inv!7743 a2!566) e!222910)))

(declare-fun e!222909 () Bool)

(assert (=> start!68718 (and (array_inv!7743 a1!566) e!222909)))

(declare-fun b!310138 () Bool)

(declare-fun res!254311 () Bool)

(assert (=> b!310138 (=> (not res!254311) (not e!222908))))

(declare-fun i!943 () (_ BitVec 32))

(assert (=> b!310138 (= res!254311 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun b!310139 () Bool)

(assert (=> b!310139 (= e!222908 (and (not (= i!943 at!235)) (= (bvand i!943 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!943 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!943) #b10000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!3125 () Bool)

(declare-fun mapRes!3125 () Bool)

(assert (=> mapIsEmpty!3125 mapRes!3125))

(declare-fun mapNonEmpty!3125 () Bool)

(declare-fun mapRes!3126 () Bool)

(declare-fun tp!3126 () Bool)

(declare-fun tp_is_empty!983 () Bool)

(assert (=> mapNonEmpty!3125 (= mapRes!3126 (and tp!3126 tp_is_empty!983))))

(declare-fun mapKey!3125 () (_ BitVec 32))

(declare-fun mapRest!3125 () (Array (_ BitVec 32) T!58449))

(declare-fun mapValue!3125 () T!58449)

(assert (=> mapNonEmpty!3125 (= (arr!9261 a1!566) (store mapRest!3125 mapKey!3125 mapValue!3125))))

(declare-fun mapNonEmpty!3126 () Bool)

(declare-fun tp!3125 () Bool)

(assert (=> mapNonEmpty!3126 (= mapRes!3125 (and tp!3125 tp_is_empty!983))))

(declare-fun mapKey!3126 () (_ BitVec 32))

(declare-fun mapValue!3126 () T!58449)

(declare-fun mapRest!3126 () (Array (_ BitVec 32) T!58449))

(assert (=> mapNonEmpty!3126 (= (arr!9261 a2!566) (store mapRest!3126 mapKey!3126 mapValue!3126))))

(declare-fun mapIsEmpty!3126 () Bool)

(assert (=> mapIsEmpty!3126 mapRes!3126))

(declare-fun b!310140 () Bool)

(assert (=> b!310140 (= e!222910 (and tp_is_empty!983 mapRes!3125))))

(declare-fun condMapEmpty!3125 () Bool)

(declare-fun mapDefault!3126 () T!58449)


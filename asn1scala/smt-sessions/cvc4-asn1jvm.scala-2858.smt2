; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68678 () Bool)

(assert start!68678)

(declare-fun mapIsEmpty!3013 () Bool)

(declare-fun mapRes!3014 () Bool)

(assert (=> mapIsEmpty!3013 mapRes!3014))

(declare-fun mapNonEmpty!3013 () Bool)

(declare-fun tp!3014 () Bool)

(declare-fun tp_is_empty!947 () Bool)

(assert (=> mapNonEmpty!3013 (= mapRes!3014 (and tp!3014 tp_is_empty!947))))

(declare-fun mapKey!3013 () (_ BitVec 32))

(declare-datatypes ((T!58293 0))(
  ( (T!58294 (val!473 Int)) )
))
(declare-fun mapRest!3014 () (Array (_ BitVec 32) T!58293))

(declare-fun mapValue!3013 () T!58293)

(declare-datatypes ((array!18813 0))(
  ( (array!18814 (arr!9243 (Array (_ BitVec 32) T!58293)) (size!8160 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18813)

(assert (=> mapNonEmpty!3013 (= (arr!9243 a2!566) (store mapRest!3014 mapKey!3013 mapValue!3013))))

(declare-fun mapNonEmpty!3014 () Bool)

(declare-fun mapRes!3013 () Bool)

(declare-fun tp!3013 () Bool)

(assert (=> mapNonEmpty!3014 (= mapRes!3013 (and tp!3013 tp_is_empty!947))))

(declare-fun a1!566 () array!18813)

(declare-fun mapRest!3013 () (Array (_ BitVec 32) T!58293))

(declare-fun mapKey!3014 () (_ BitVec 32))

(declare-fun mapValue!3014 () T!58293)

(assert (=> mapNonEmpty!3014 (= (arr!9243 a1!566) (store mapRest!3013 mapKey!3014 mapValue!3014))))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun from!692 () (_ BitVec 32))

(declare-fun e!222740 () Bool)

(declare-fun b!309807 () Bool)

(declare-fun to!659 () (_ BitVec 32))

(assert (=> b!309807 (= e!222740 (and (bvsle from!692 i!943) (bvsle i!943 at!235) (or (bvsgt #b00000000000000000000000000000000 i!943) (bvsgt i!943 to!659))))))

(declare-fun mapIsEmpty!3014 () Bool)

(assert (=> mapIsEmpty!3014 mapRes!3013))

(declare-fun b!309808 () Bool)

(declare-fun res!254088 () Bool)

(assert (=> b!309808 (=> (not res!254088) (not e!222740))))

(declare-fun arrayRangesEq!1766 (array!18813 array!18813 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309808 (= res!254088 (arrayRangesEq!1766 a1!566 a2!566 from!692 to!659))))

(declare-fun b!309809 () Bool)

(declare-fun e!222738 () Bool)

(assert (=> b!309809 (= e!222738 (and tp_is_empty!947 mapRes!3014))))

(declare-fun condMapEmpty!3014 () Bool)

(declare-fun mapDefault!3014 () T!58293)


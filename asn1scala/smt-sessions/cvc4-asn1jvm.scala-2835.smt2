; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68528 () Bool)

(assert start!68528)

(declare-fun b!307947 () Bool)

(declare-fun res!252649 () Bool)

(declare-fun e!221822 () Bool)

(assert (=> b!307947 (=> (not res!252649) (not e!221822))))

(declare-datatypes ((T!57695 0))(
  ( (T!57696 (val!404 Int)) )
))
(declare-datatypes ((array!18673 0))(
  ( (array!18674 (arr!9174 (Array (_ BitVec 32) T!57695)) (size!8091 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18673)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun a1!524 () array!18673)

(declare-fun arrayRangesEq!1712 (array!18673 array!18673 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307947 (= res!252649 (arrayRangesEq!1712 a1!524 a2!524 from!650 to!617))))

(declare-fun b!307948 () Bool)

(declare-fun i!932 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!307948 (= e!221822 (and (bvsle i!932 toSlice!46) (bvsgt #b00000000000000000000000000000000 i!932)))))

(declare-fun mapIsEmpty!2591 () Bool)

(declare-fun mapRes!2592 () Bool)

(assert (=> mapIsEmpty!2591 mapRes!2592))

(declare-fun b!307950 () Bool)

(declare-fun res!252650 () Bool)

(assert (=> b!307950 (=> (not res!252650) (not e!221822))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!307950 (= res!252650 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun mapNonEmpty!2591 () Bool)

(declare-fun tp!2592 () Bool)

(declare-fun tp_is_empty!809 () Bool)

(assert (=> mapNonEmpty!2591 (= mapRes!2592 (and tp!2592 tp_is_empty!809))))

(declare-fun mapValue!2591 () T!57695)

(declare-fun mapRest!2592 () (Array (_ BitVec 32) T!57695))

(declare-fun mapKey!2592 () (_ BitVec 32))

(assert (=> mapNonEmpty!2591 (= (arr!9174 a1!524) (store mapRest!2592 mapKey!2592 mapValue!2591))))

(declare-fun mapIsEmpty!2592 () Bool)

(declare-fun mapRes!2591 () Bool)

(assert (=> mapIsEmpty!2592 mapRes!2591))

(declare-fun b!307951 () Bool)

(declare-fun e!221823 () Bool)

(assert (=> b!307951 (= e!221823 (and tp_is_empty!809 mapRes!2592))))

(declare-fun condMapEmpty!2591 () Bool)

(declare-fun mapDefault!2591 () T!57695)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68684 () Bool)

(assert start!68684)

(declare-fun mapNonEmpty!3031 () Bool)

(declare-fun mapRes!3032 () Bool)

(declare-fun tp!3032 () Bool)

(declare-fun tp_is_empty!953 () Bool)

(assert (=> mapNonEmpty!3031 (= mapRes!3032 (and tp!3032 tp_is_empty!953))))

(declare-datatypes ((T!58319 0))(
  ( (T!58320 (val!476 Int)) )
))
(declare-datatypes ((array!18819 0))(
  ( (array!18820 (arr!9246 (Array (_ BitVec 32) T!58319)) (size!8163 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18819)

(declare-fun mapKey!3031 () (_ BitVec 32))

(declare-fun mapValue!3031 () T!58319)

(declare-fun mapRest!3031 () (Array (_ BitVec 32) T!58319))

(assert (=> mapNonEmpty!3031 (= (arr!9246 a1!566) (store mapRest!3031 mapKey!3031 mapValue!3031))))

(declare-fun b!309859 () Bool)

(declare-fun res!254124 () Bool)

(declare-fun e!222766 () Bool)

(assert (=> b!309859 (=> (not res!254124) (not e!222766))))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun to!659 () (_ BitVec 32))

(declare-fun a2!566 () array!18819)

(declare-fun arrayRangesEq!1768 (array!18819 array!18819 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309859 (= res!254124 (arrayRangesEq!1768 a1!566 a2!566 i!943 to!659))))

(declare-fun b!309860 () Bool)

(declare-fun e!222765 () Bool)

(assert (=> b!309860 (= e!222765 (and tp_is_empty!953 mapRes!3032))))

(declare-fun condMapEmpty!3032 () Bool)

(declare-fun mapDefault!3031 () T!58319)


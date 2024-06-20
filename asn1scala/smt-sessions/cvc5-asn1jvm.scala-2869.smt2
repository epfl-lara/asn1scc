; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68748 () Bool)

(assert start!68748)

(declare-fun b!310433 () Bool)

(declare-fun res!254527 () Bool)

(declare-fun e!223035 () Bool)

(assert (=> b!310433 (=> (not res!254527) (not e!223035))))

(declare-fun to!659 () (_ BitVec 32))

(declare-datatypes ((T!58575 0))(
  ( (T!58576 (val!504 Int)) )
))
(declare-datatypes ((array!18877 0))(
  ( (array!18878 (arr!9274 (Array (_ BitVec 32) T!58575)) (size!8191 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18877)

(declare-fun a1!566 () array!18877)

(declare-fun from!692 () (_ BitVec 32))

(declare-fun arrayRangesEq!1786 (array!18877 array!18877 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310433 (= res!254527 (arrayRangesEq!1786 a1!566 a2!566 from!692 to!659))))

(declare-fun b!310434 () Bool)

(declare-fun res!254525 () Bool)

(assert (=> b!310434 (=> (not res!254525) (not e!223035))))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun at!235 () (_ BitVec 32))

(assert (=> b!310434 (= res!254525 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun b!310435 () Bool)

(declare-fun res!254528 () Bool)

(assert (=> b!310435 (=> (not res!254528) (not e!223035))))

(assert (=> b!310435 (= res!254528 (arrayRangesEq!1786 a1!566 a2!566 i!943 to!659))))

(declare-fun mapNonEmpty!3207 () Bool)

(declare-fun mapRes!3207 () Bool)

(declare-fun tp!3207 () Bool)

(declare-fun tp_is_empty!1009 () Bool)

(assert (=> mapNonEmpty!3207 (= mapRes!3207 (and tp!3207 tp_is_empty!1009))))

(declare-fun mapValue!3207 () T!58575)

(declare-fun mapRest!3207 () (Array (_ BitVec 32) T!58575))

(declare-fun mapKey!3207 () (_ BitVec 32))

(assert (=> mapNonEmpty!3207 (= (arr!9274 a1!566) (store mapRest!3207 mapKey!3207 mapValue!3207))))

(declare-fun b!310436 () Bool)

(declare-fun res!254530 () Bool)

(assert (=> b!310436 (=> (not res!254530) (not e!223035))))

(assert (=> b!310436 (= res!254530 (and (not (= i!943 at!235)) (bvsle from!692 (bvadd #b00000000000000000000000000000001 i!943)) (bvsle (bvadd #b00000000000000000000000000000001 i!943) at!235)))))

(declare-fun b!310437 () Bool)

(declare-fun e!223037 () Bool)

(assert (=> b!310437 (= e!223037 (and tp_is_empty!1009 mapRes!3207))))

(declare-fun condMapEmpty!3207 () Bool)

(declare-fun mapDefault!3208 () T!58575)


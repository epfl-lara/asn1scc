; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68754 () Bool)

(assert start!68754)

(declare-fun mapNonEmpty!3225 () Bool)

(declare-fun mapRes!3226 () Bool)

(declare-fun tp!3226 () Bool)

(declare-fun tp_is_empty!1015 () Bool)

(assert (=> mapNonEmpty!3225 (= mapRes!3226 (and tp!3226 tp_is_empty!1015))))

(declare-datatypes ((T!58601 0))(
  ( (T!58602 (val!507 Int)) )
))
(declare-fun mapRest!3225 () (Array (_ BitVec 32) T!58601))

(declare-fun mapValue!3225 () T!58601)

(declare-fun mapKey!3226 () (_ BitVec 32))

(declare-datatypes ((array!18883 0))(
  ( (array!18884 (arr!9277 (Array (_ BitVec 32) T!58601)) (size!8194 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18883)

(assert (=> mapNonEmpty!3225 (= (arr!9277 a2!566) (store mapRest!3225 mapKey!3226 mapValue!3225))))

(declare-fun b!310506 () Bool)

(declare-fun res!254579 () Bool)

(declare-fun e!223062 () Bool)

(assert (=> b!310506 (=> (not res!254579) (not e!223062))))

(declare-fun to!659 () (_ BitVec 32))

(declare-fun a1!566 () array!18883)

(declare-fun from!692 () (_ BitVec 32))

(declare-fun arrayRangesEq!1788 (array!18883 array!18883 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310506 (= res!254579 (arrayRangesEq!1788 a1!566 a2!566 from!692 to!659))))

(declare-fun mapNonEmpty!3226 () Bool)

(declare-fun mapRes!3225 () Bool)

(declare-fun tp!3225 () Bool)

(assert (=> mapNonEmpty!3226 (= mapRes!3225 (and tp!3225 tp_is_empty!1015))))

(declare-fun mapKey!3225 () (_ BitVec 32))

(declare-fun mapRest!3226 () (Array (_ BitVec 32) T!58601))

(declare-fun mapValue!3226 () T!58601)

(assert (=> mapNonEmpty!3226 (= (arr!9277 a1!566) (store mapRest!3226 mapKey!3225 mapValue!3226))))

(declare-fun b!310507 () Bool)

(assert (=> b!310507 (= e!223062 (not true))))

(declare-fun at!235 () (_ BitVec 32))

(assert (=> b!310507 (= (select (arr!9277 a1!566) at!235) (select (arr!9277 a2!566) at!235))))

(declare-fun i!943 () (_ BitVec 32))

(declare-datatypes ((Unit!21503 0))(
  ( (Unit!21504) )
))
(declare-fun lt!440466 () Unit!21503)

(declare-fun rec!109 (array!18883 array!18883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21503)

(assert (=> b!310507 (= lt!440466 (rec!109 a1!566 a2!566 at!235 from!692 to!659 (bvadd #b00000000000000000000000000000001 i!943)))))

(declare-fun b!310508 () Bool)

(declare-fun res!254582 () Bool)

(assert (=> b!310508 (=> (not res!254582) (not e!223062))))

(assert (=> b!310508 (= res!254582 (arrayRangesEq!1788 a1!566 a2!566 i!943 to!659))))

(declare-fun mapIsEmpty!3225 () Bool)

(assert (=> mapIsEmpty!3225 mapRes!3226))

(declare-fun b!310509 () Bool)

(declare-fun res!254583 () Bool)

(assert (=> b!310509 (=> (not res!254583) (not e!223062))))

(assert (=> b!310509 (= res!254583 (arrayRangesEq!1788 a1!566 a2!566 (bvadd #b00000000000000000000000000000001 i!943) to!659))))

(declare-fun b!310505 () Bool)

(declare-fun e!223064 () Bool)

(assert (=> b!310505 (= e!223064 (and tp_is_empty!1015 mapRes!3225))))

(declare-fun condMapEmpty!3225 () Bool)

(declare-fun mapDefault!3225 () T!58601)


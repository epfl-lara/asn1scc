; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24562 () Bool)

(assert start!24562)

(declare-fun mapIsEmpty!412 () Bool)

(declare-fun mapRes!412 () Bool)

(assert (=> mapIsEmpty!412 mapRes!412))

(declare-fun mapNonEmpty!412 () Bool)

(declare-fun tp!413 () Bool)

(declare-fun tp_is_empty!137 () Bool)

(assert (=> mapNonEmpty!412 (= mapRes!412 (and tp!413 tp_is_empty!137))))

(declare-datatypes ((T!17003 0))(
  ( (T!17004 (val!68 Int)) )
))
(declare-datatypes ((array!5528 0))(
  ( (array!5529 (arr!3095 (Array (_ BitVec 32) T!17003)) (size!2502 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5528)

(declare-fun mapValue!412 () T!17003)

(declare-fun mapKey!412 () (_ BitVec 32))

(declare-fun mapRest!413 () (Array (_ BitVec 32) T!17003))

(assert (=> mapNonEmpty!412 (= (arr!3095 a2!447) (store mapRest!413 mapKey!412 mapValue!412))))

(declare-fun b!124668 () Bool)

(declare-fun e!81802 () Bool)

(assert (=> b!124668 (= e!81802 (and tp_is_empty!137 mapRes!412))))

(declare-fun condMapEmpty!413 () Bool)

(declare-fun mapDefault!413 () T!17003)


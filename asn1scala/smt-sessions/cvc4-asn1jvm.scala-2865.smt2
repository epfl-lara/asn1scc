; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68724 () Bool)

(assert start!68724)

(declare-fun mapNonEmpty!3143 () Bool)

(declare-fun mapRes!3143 () Bool)

(declare-fun tp!3144 () Bool)

(declare-fun tp_is_empty!989 () Bool)

(assert (=> mapNonEmpty!3143 (= mapRes!3143 (and tp!3144 tp_is_empty!989))))

(declare-datatypes ((T!58475 0))(
  ( (T!58476 (val!494 Int)) )
))
(declare-fun mapValue!3144 () T!58475)

(declare-fun mapKey!3143 () (_ BitVec 32))

(declare-fun mapRest!3144 () (Array (_ BitVec 32) T!58475))

(declare-datatypes ((array!18856 0))(
  ( (array!18857 (arr!9264 (Array (_ BitVec 32) T!58475)) (size!8181 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18856)

(assert (=> mapNonEmpty!3143 (= (arr!9264 a2!566) (store mapRest!3144 mapKey!3143 mapValue!3144))))

(declare-fun mapIsEmpty!3143 () Bool)

(declare-fun mapRes!3144 () Bool)

(assert (=> mapIsEmpty!3143 mapRes!3144))

(declare-fun b!310192 () Bool)

(declare-fun res!254349 () Bool)

(declare-fun e!222936 () Bool)

(assert (=> b!310192 (=> (not res!254349) (not e!222936))))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun from!692 () (_ BitVec 32))

(assert (=> b!310192 (= res!254349 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun mapNonEmpty!3144 () Bool)

(declare-fun tp!3143 () Bool)

(assert (=> mapNonEmpty!3144 (= mapRes!3144 (and tp!3143 tp_is_empty!989))))

(declare-fun a1!566 () array!18856)

(declare-fun mapRest!3143 () (Array (_ BitVec 32) T!58475))

(declare-fun mapKey!3144 () (_ BitVec 32))

(declare-fun mapValue!3143 () T!58475)

(assert (=> mapNonEmpty!3144 (= (arr!9264 a1!566) (store mapRest!3143 mapKey!3144 mapValue!3143))))

(declare-fun b!310193 () Bool)

(assert (=> b!310193 (= e!222936 (and (not (= i!943 at!235)) (or (bvsgt from!692 (bvadd #b00000000000000000000000000000001 i!943)) (bvsgt (bvadd #b00000000000000000000000000000001 i!943) at!235))))))

(declare-fun b!310194 () Bool)

(declare-fun e!222935 () Bool)

(assert (=> b!310194 (= e!222935 (and tp_is_empty!989 mapRes!3144))))

(declare-fun condMapEmpty!3144 () Bool)

(declare-fun mapDefault!3143 () T!58475)


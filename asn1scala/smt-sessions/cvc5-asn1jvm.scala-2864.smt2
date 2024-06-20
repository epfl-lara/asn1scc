; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68714 () Bool)

(assert start!68714)

(declare-fun b!310102 () Bool)

(declare-fun res!254287 () Bool)

(declare-fun e!222892 () Bool)

(assert (=> b!310102 (=> (not res!254287) (not e!222892))))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun from!692 () (_ BitVec 32))

(assert (=> b!310102 (= res!254287 (and (bvsle from!692 i!943) (bvsle i!943 at!235)))))

(declare-fun b!310104 () Bool)

(declare-fun e!222891 () Bool)

(declare-fun tp_is_empty!979 () Bool)

(declare-fun mapRes!3114 () Bool)

(assert (=> b!310104 (= e!222891 (and tp_is_empty!979 mapRes!3114))))

(declare-fun condMapEmpty!3113 () Bool)

(declare-datatypes ((T!58445 0))(
  ( (T!58446 (val!489 Int)) )
))
(declare-datatypes ((array!18846 0))(
  ( (array!18847 (arr!9259 (Array (_ BitVec 32) T!58445)) (size!8176 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18846)

(declare-fun mapDefault!3114 () T!58445)


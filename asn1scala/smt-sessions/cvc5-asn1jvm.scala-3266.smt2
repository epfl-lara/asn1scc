; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74072 () Bool)

(assert start!74072)

(declare-datatypes ((Unit!22147 0))(
  ( (Unit!22148) )
))
(declare-fun lt!448655 () Unit!22147)

(declare-datatypes ((T!66593 0))(
  ( (T!66594 (val!543 Int)) )
))
(declare-datatypes ((array!21308 0))(
  ( (array!21309 (arr!10339 (Array (_ BitVec 32) T!66593)) (size!9247 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21308)

(declare-fun rec!120 (array!21308 (_ BitVec 32)) Unit!22147)

(assert (=> start!74072 (= lt!448655 (rec!120 a!404 (size!9247 a!404)))))

(declare-fun arrayRangesEq!1859 (array!21308 array!21308 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!74072 (not (arrayRangesEq!1859 a!404 a!404 #b00000000000000000000000000000000 (size!9247 a!404)))))

(declare-fun e!236105 () Bool)

(declare-fun array_inv!8798 (array!21308) Bool)

(assert (=> start!74072 (and (array_inv!8798 a!404) e!236105)))

(declare-fun b!326796 () Bool)

(declare-fun tp_is_empty!1087 () Bool)

(declare-fun mapRes!3352 () Bool)

(assert (=> b!326796 (= e!236105 (and tp_is_empty!1087 mapRes!3352))))

(declare-fun condMapEmpty!3352 () Bool)

(declare-fun mapDefault!3352 () T!66593)


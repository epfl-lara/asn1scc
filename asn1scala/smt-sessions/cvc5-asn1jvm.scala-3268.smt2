; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74090 () Bool)

(assert start!74090)

(declare-fun b!326850 () Bool)

(declare-fun res!268337 () Bool)

(declare-fun e!236144 () Bool)

(assert (=> b!326850 (=> (not res!268337) (not e!236144))))

(declare-datatypes ((T!66645 0))(
  ( (T!66646 (val!549 Int)) )
))
(declare-datatypes ((array!21321 0))(
  ( (array!21322 (arr!10345 (Array (_ BitVec 32) T!66645)) (size!9253 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21321)

(declare-fun i!907 () (_ BitVec 32))

(declare-fun arrayRangesEq!1864 (array!21321 array!21321 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326850 (= res!268337 (arrayRangesEq!1864 a!407 a!407 i!907 (size!9253 a!407)))))

(declare-fun mapNonEmpty!3373 () Bool)

(declare-fun mapRes!3373 () Bool)

(declare-fun tp!3373 () Bool)

(declare-fun tp_is_empty!1099 () Bool)

(assert (=> mapNonEmpty!3373 (= mapRes!3373 (and tp!3373 tp_is_empty!1099))))

(declare-fun mapKey!3373 () (_ BitVec 32))

(declare-fun mapValue!3373 () T!66645)

(declare-fun mapRest!3373 () (Array (_ BitVec 32) T!66645))

(assert (=> mapNonEmpty!3373 (= (arr!10345 a!407) (store mapRest!3373 mapKey!3373 mapValue!3373))))

(declare-fun b!326851 () Bool)

(declare-fun e!236143 () Bool)

(assert (=> b!326851 (= e!236143 (and tp_is_empty!1099 mapRes!3373))))

(declare-fun condMapEmpty!3373 () Bool)

(declare-fun mapDefault!3373 () T!66645)


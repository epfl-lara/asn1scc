; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66698 () Bool)

(assert start!66698)

(declare-fun res!246157 () Bool)

(declare-fun e!213852 () Bool)

(assert (=> start!66698 (=> (not res!246157) (not e!213852))))

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17961 0))(
  ( (array!17962 (arr!8871 (Array (_ BitVec 32) (_ BitVec 8))) (size!7788 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17961)

(assert (=> start!66698 (= res!246157 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7788 a!429))))))))

(assert (=> start!66698 e!213852))

(assert (=> start!66698 true))

(declare-fun array_inv!7400 (array!17961) Bool)

(assert (=> start!66698 (array_inv!7400 a!429)))

(declare-fun b!298355 () Bool)

(declare-fun e!213850 () Bool)

(assert (=> b!298355 (= e!213852 e!213850)))

(declare-fun res!246158 () Bool)

(assert (=> b!298355 (=> (not res!246158) (not e!213850))))

(declare-fun lt!434462 () array!17961)

(declare-fun arrayBitRangesEq!0 (array!17961 array!17961 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298355 (= res!246158 (arrayBitRangesEq!0 a!429 lt!434462 at!281 at!281))))

(declare-fun lt!434460 () (_ BitVec 32))

(declare-fun b!315 () Bool)

(declare-fun lt!434463 () (_ BitVec 32))

(assert (=> b!298355 (= lt!434462 (array!17962 (store (arr!8871 a!429) lt!434460 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8871 a!429) lt!434460)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434463)))) ((_ sign_extend 24) (ite b!315 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434463) #b00000000))))) (size!7788 a!429)))))

(assert (=> b!298355 (= lt!434463 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298355 (= lt!434460 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298356 () Bool)

(assert (=> b!298356 (= e!213850 (not true))))

(assert (=> b!298356 (arrayBitRangesEq!0 a!429 lt!434462 #b0000000000000000000000000000000000000000000000000000000000000000 at!281)))

(declare-datatypes ((Unit!20825 0))(
  ( (Unit!20826) )
))
(declare-fun lt!434461 () Unit!20825)

(declare-fun rec!19 (array!17961 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20825)

(assert (=> b!298356 (= lt!434461 (rec!19 a!429 at!281 b!315 at!281))))

(assert (= (and start!66698 res!246157) b!298355))

(assert (= (and b!298355 res!246158) b!298356))

(declare-fun m!437393 () Bool)

(assert (=> start!66698 m!437393))

(declare-fun m!437395 () Bool)

(assert (=> b!298355 m!437395))

(declare-fun m!437397 () Bool)

(assert (=> b!298355 m!437397))

(declare-fun m!437399 () Bool)

(assert (=> b!298355 m!437399))

(declare-fun m!437401 () Bool)

(assert (=> b!298355 m!437401))

(declare-fun m!437403 () Bool)

(assert (=> b!298356 m!437403))

(declare-fun m!437405 () Bool)

(assert (=> b!298356 m!437405))

(push 1)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66702 () Bool)

(assert start!66702)

(declare-fun res!246174 () Bool)

(declare-fun e!213875 () Bool)

(assert (=> start!66702 (=> (not res!246174) (not e!213875))))

(declare-fun at!281 () (_ BitVec 64))

(assert (=> start!66702 (= res!246174 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281))))

(assert (=> start!66702 e!213875))

(assert (=> start!66702 true))

(declare-datatypes ((array!17965 0))(
  ( (array!17966 (arr!8873 (Array (_ BitVec 32) (_ BitVec 8))) (size!7790 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17965)

(declare-fun array_inv!7402 (array!17965) Bool)

(assert (=> start!66702 (array_inv!7402 a!429)))

(declare-fun b!298372 () Bool)

(declare-fun e!213873 () Bool)

(assert (=> b!298372 (= e!213875 e!213873)))

(declare-fun res!246176 () Bool)

(assert (=> b!298372 (=> (not res!246176) (not e!213873))))

(declare-fun lt!434490 () (_ BitVec 64))

(assert (=> b!298372 (= res!246176 (bvslt at!281 lt!434490))))

(assert (=> b!298372 (= lt!434490 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7790 a!429))))))

(declare-fun b!298373 () Bool)

(declare-fun e!213874 () Bool)

(assert (=> b!298373 (= e!213873 e!213874)))

(declare-fun res!246175 () Bool)

(assert (=> b!298373 (=> (not res!246175) (not e!213874))))

(declare-fun lt!434489 () array!17965)

(declare-fun arrayBitRangesEq!0 (array!17965 array!17965 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298373 (= res!246175 (arrayBitRangesEq!0 a!429 lt!434489 at!281 at!281))))

(declare-fun b!315 () Bool)

(declare-fun lt!434492 () (_ BitVec 32))

(declare-fun lt!434493 () (_ BitVec 32))

(assert (=> b!298373 (= lt!434489 (array!17966 (store (arr!8873 a!429) lt!434492 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8873 a!429) lt!434492)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434493)))) ((_ sign_extend 24) (ite b!315 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434493) #b00000000))))) (size!7790 a!429)))))

(assert (=> b!298373 (= lt!434493 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298373 (= lt!434492 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298374 () Bool)

(assert (=> b!298374 (= e!213874 (not (bvsle at!281 lt!434490)))))

(assert (=> b!298374 (arrayBitRangesEq!0 a!429 lt!434489 #b0000000000000000000000000000000000000000000000000000000000000000 at!281)))

(declare-datatypes ((Unit!20829 0))(
  ( (Unit!20830) )
))
(declare-fun lt!434491 () Unit!20829)

(declare-fun rec!19 (array!17965 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20829)

(assert (=> b!298374 (= lt!434491 (rec!19 a!429 at!281 b!315 at!281))))

(assert (= (and start!66702 res!246174) b!298372))

(assert (= (and b!298372 res!246176) b!298373))

(assert (= (and b!298373 res!246175) b!298374))

(declare-fun m!437421 () Bool)

(assert (=> start!66702 m!437421))

(declare-fun m!437423 () Bool)

(assert (=> b!298373 m!437423))

(declare-fun m!437425 () Bool)

(assert (=> b!298373 m!437425))

(declare-fun m!437427 () Bool)

(assert (=> b!298373 m!437427))

(declare-fun m!437429 () Bool)

(assert (=> b!298373 m!437429))

(declare-fun m!437431 () Bool)

(assert (=> b!298374 m!437431))

(declare-fun m!437433 () Bool)

(assert (=> b!298374 m!437433))

(check-sat (not b!298374) (not b!298373) (not start!66702))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66888 () Bool)

(assert start!66888)

(declare-fun b!299015 () Bool)

(declare-fun e!214578 () Bool)

(assert (=> b!299015 (= e!214578 (not true))))

(declare-datatypes ((array!18115 0))(
  ( (array!18116 (arr!8945 (Array (_ BitVec 32) (_ BitVec 8))) (size!7862 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18115)

(declare-fun lt!434962 () array!18115)

(declare-fun at!286 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18115 array!18115 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299015 (arrayBitRangesEq!0 a!434 lt!434962 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))

(declare-datatypes ((Unit!20865 0))(
  ( (Unit!20866) )
))
(declare-fun lt!434961 () Unit!20865)

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun b!320 () Bool)

(declare-fun rec!19 (array!18115 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20865)

(assert (=> b!299015 (= lt!434961 (rec!19 a!434 at!286 b!320 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!299016 () Bool)

(declare-fun e!214575 () Bool)

(assert (=> b!299016 (= e!214575 e!214578)))

(declare-fun res!246775 () Bool)

(assert (=> b!299016 (=> (not res!246775) (not e!214578))))

(assert (=> b!299016 (= res!246775 (arrayBitRangesEq!0 a!434 lt!434962 i!1010 at!286))))

(declare-fun lt!434963 () (_ BitVec 32))

(declare-fun lt!434964 () (_ BitVec 32))

(assert (=> b!299016 (= lt!434962 (array!18116 (store (arr!8945 a!434) lt!434963 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8945 a!434) lt!434963)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434964)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434964) #b00000000))))) (size!7862 a!434)))))

(declare-fun b!299017 () Bool)

(declare-fun e!214576 () Bool)

(assert (=> b!299017 (= e!214576 e!214575)))

(declare-fun res!246777 () Bool)

(assert (=> b!299017 (=> (not res!246777) (not e!214575))))

(assert (=> b!299017 (= res!246777 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(assert (=> b!299017 (= lt!434964 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299017 (= lt!434963 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!246776 () Bool)

(assert (=> start!66888 (=> (not res!246776) (not e!214576))))

(assert (=> start!66888 (= res!246776 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7862 a!434))))))))

(assert (=> start!66888 e!214576))

(assert (=> start!66888 true))

(declare-fun array_inv!7474 (array!18115) Bool)

(assert (=> start!66888 (array_inv!7474 a!434)))

(declare-fun b!299018 () Bool)

(declare-fun res!246778 () Bool)

(assert (=> b!299018 (=> (not res!246778) (not e!214578))))

(assert (=> b!299018 (= res!246778 (arrayBitRangesEq!0 a!434 lt!434962 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(declare-fun b!299019 () Bool)

(declare-fun res!246779 () Bool)

(assert (=> b!299019 (=> (not res!246779) (not e!214578))))

(assert (=> b!299019 (= res!246779 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(assert (= (and start!66888 res!246776) b!299017))

(assert (= (and b!299017 res!246777) b!299016))

(assert (= (and b!299016 res!246775) b!299019))

(assert (= (and b!299019 res!246779) b!299018))

(assert (= (and b!299018 res!246778) b!299015))

(declare-fun m!438269 () Bool)

(assert (=> b!299015 m!438269))

(declare-fun m!438271 () Bool)

(assert (=> b!299015 m!438271))

(declare-fun m!438273 () Bool)

(assert (=> b!299016 m!438273))

(declare-fun m!438275 () Bool)

(assert (=> b!299016 m!438275))

(declare-fun m!438277 () Bool)

(assert (=> b!299016 m!438277))

(declare-fun m!438279 () Bool)

(assert (=> b!299016 m!438279))

(declare-fun m!438281 () Bool)

(assert (=> start!66888 m!438281))

(declare-fun m!438283 () Bool)

(assert (=> b!299018 m!438283))

(check-sat (not b!299016) (not b!299015) (not start!66888) (not b!299018))

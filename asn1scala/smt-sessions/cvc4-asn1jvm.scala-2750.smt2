; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66806 () Bool)

(assert start!66806)

(declare-fun b!298621 () Bool)

(declare-fun e!214210 () Bool)

(declare-fun e!214211 () Bool)

(assert (=> b!298621 (= e!214210 e!214211)))

(declare-fun res!246407 () Bool)

(assert (=> b!298621 (=> (not res!246407) (not e!214211))))

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun at!286 () (_ BitVec 64))

(assert (=> b!298621 (= res!246407 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434733 () (_ BitVec 32))

(assert (=> b!298621 (= lt!434733 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434730 () (_ BitVec 32))

(assert (=> b!298621 (= lt!434730 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298622 () Bool)

(declare-fun res!246409 () Bool)

(declare-fun e!214208 () Bool)

(assert (=> b!298622 (=> (not res!246409) (not e!214208))))

(assert (=> b!298622 (= res!246409 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(declare-fun b!298623 () Bool)

(declare-fun lt!434731 () (_ BitVec 64))

(assert (=> b!298623 (= e!214208 (not (bvsle at!286 lt!434731)))))

(declare-datatypes ((array!18060 0))(
  ( (array!18061 (arr!8919 (Array (_ BitVec 32) (_ BitVec 8))) (size!7836 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18060)

(declare-fun lt!434729 () array!18060)

(declare-fun arrayBitRangesEq!0 (array!18060 array!18060 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298623 (arrayBitRangesEq!0 a!434 lt!434729 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))

(declare-datatypes ((Unit!20855 0))(
  ( (Unit!20856) )
))
(declare-fun lt!434732 () Unit!20855)

(declare-fun b!320 () Bool)

(declare-fun rec!19 (array!18060 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20855)

(assert (=> b!298623 (= lt!434732 (rec!19 a!434 at!286 b!320 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!246405 () Bool)

(declare-fun e!214212 () Bool)

(assert (=> start!66806 (=> (not res!246405) (not e!214212))))

(assert (=> start!66806 (= res!246405 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286))))

(assert (=> start!66806 e!214212))

(assert (=> start!66806 true))

(declare-fun array_inv!7448 (array!18060) Bool)

(assert (=> start!66806 (array_inv!7448 a!434)))

(declare-fun b!298624 () Bool)

(assert (=> b!298624 (= e!214212 e!214210)))

(declare-fun res!246410 () Bool)

(assert (=> b!298624 (=> (not res!246410) (not e!214210))))

(assert (=> b!298624 (= res!246410 (bvslt at!286 lt!434731))))

(assert (=> b!298624 (= lt!434731 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7836 a!434))))))

(declare-fun b!298625 () Bool)

(assert (=> b!298625 (= e!214211 e!214208)))

(declare-fun res!246406 () Bool)

(assert (=> b!298625 (=> (not res!246406) (not e!214208))))

(assert (=> b!298625 (= res!246406 (arrayBitRangesEq!0 a!434 lt!434729 i!1010 at!286))))

(assert (=> b!298625 (= lt!434729 (array!18061 (store (arr!8919 a!434) lt!434730 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8919 a!434) lt!434730)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434733)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434733) #b00000000))))) (size!7836 a!434)))))

(declare-fun b!298626 () Bool)

(declare-fun res!246408 () Bool)

(assert (=> b!298626 (=> (not res!246408) (not e!214208))))

(assert (=> b!298626 (= res!246408 (arrayBitRangesEq!0 a!434 lt!434729 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(assert (= (and start!66806 res!246405) b!298624))

(assert (= (and b!298624 res!246410) b!298621))

(assert (= (and b!298621 res!246407) b!298625))

(assert (= (and b!298625 res!246406) b!298622))

(assert (= (and b!298622 res!246409) b!298626))

(assert (= (and b!298626 res!246408) b!298623))

(declare-fun m!437775 () Bool)

(assert (=> b!298623 m!437775))

(declare-fun m!437777 () Bool)

(assert (=> b!298623 m!437777))

(declare-fun m!437779 () Bool)

(assert (=> start!66806 m!437779))

(declare-fun m!437781 () Bool)

(assert (=> b!298625 m!437781))

(declare-fun m!437783 () Bool)

(assert (=> b!298625 m!437783))

(declare-fun m!437785 () Bool)

(assert (=> b!298625 m!437785))

(declare-fun m!437787 () Bool)

(assert (=> b!298625 m!437787))

(declare-fun m!437789 () Bool)

(assert (=> b!298626 m!437789))

(push 1)

(assert (not b!298623))

(assert (not start!66806))

(assert (not b!298626))

(assert (not b!298625))

(check-sat)

(pop 1)

(push 1)

(check-sat)


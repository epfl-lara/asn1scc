; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66798 () Bool)

(assert start!66798)

(declare-fun b!298553 () Bool)

(declare-fun e!214155 () Bool)

(declare-fun e!214153 () Bool)

(assert (=> b!298553 (= e!214155 e!214153)))

(declare-fun res!246341 () Bool)

(assert (=> b!298553 (=> (not res!246341) (not e!214153))))

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18052 0))(
  ( (array!18053 (arr!8915 (Array (_ BitVec 32) (_ BitVec 8))) (size!7832 (_ BitVec 32))) )
))
(declare-fun lt!434673 () array!18052)

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun a!434 () array!18052)

(declare-fun arrayBitRangesEq!0 (array!18052 array!18052 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298553 (= res!246341 (arrayBitRangesEq!0 a!434 lt!434673 i!1010 at!286))))

(declare-fun lt!434676 () (_ BitVec 32))

(declare-fun lt!434674 () (_ BitVec 32))

(declare-fun b!320 () Bool)

(assert (=> b!298553 (= lt!434673 (array!18053 (store (arr!8915 a!434) lt!434676 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8915 a!434) lt!434676)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434674)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434674) #b00000000))))) (size!7832 a!434)))))

(declare-fun res!246339 () Bool)

(declare-fun e!214152 () Bool)

(assert (=> start!66798 (=> (not res!246339) (not e!214152))))

(assert (=> start!66798 (= res!246339 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7832 a!434))))))))

(assert (=> start!66798 e!214152))

(assert (=> start!66798 true))

(declare-fun array_inv!7444 (array!18052) Bool)

(assert (=> start!66798 (array_inv!7444 a!434)))

(declare-fun b!298554 () Bool)

(declare-fun res!246338 () Bool)

(assert (=> b!298554 (=> (not res!246338) (not e!214153))))

(assert (=> b!298554 (= res!246338 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(declare-fun b!298555 () Bool)

(assert (=> b!298555 (= e!214153 (not true))))

(assert (=> b!298555 (arrayBitRangesEq!0 a!434 lt!434673 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))

(declare-datatypes ((Unit!20847 0))(
  ( (Unit!20848) )
))
(declare-fun lt!434675 () Unit!20847)

(declare-fun rec!19 (array!18052 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20847)

(assert (=> b!298555 (= lt!434675 (rec!19 a!434 at!286 b!320 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!298556 () Bool)

(assert (=> b!298556 (= e!214152 e!214155)))

(declare-fun res!246340 () Bool)

(assert (=> b!298556 (=> (not res!246340) (not e!214155))))

(assert (=> b!298556 (= res!246340 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(assert (=> b!298556 (= lt!434674 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298556 (= lt!434676 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298557 () Bool)

(declare-fun res!246337 () Bool)

(assert (=> b!298557 (=> (not res!246337) (not e!214153))))

(assert (=> b!298557 (= res!246337 (arrayBitRangesEq!0 a!434 lt!434673 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(assert (= (and start!66798 res!246339) b!298556))

(assert (= (and b!298556 res!246340) b!298553))

(assert (= (and b!298553 res!246341) b!298554))

(assert (= (and b!298554 res!246338) b!298557))

(assert (= (and b!298557 res!246337) b!298555))

(declare-fun m!437711 () Bool)

(assert (=> b!298553 m!437711))

(declare-fun m!437713 () Bool)

(assert (=> b!298553 m!437713))

(declare-fun m!437715 () Bool)

(assert (=> b!298553 m!437715))

(declare-fun m!437717 () Bool)

(assert (=> b!298553 m!437717))

(declare-fun m!437719 () Bool)

(assert (=> start!66798 m!437719))

(declare-fun m!437721 () Bool)

(assert (=> b!298555 m!437721))

(declare-fun m!437723 () Bool)

(assert (=> b!298555 m!437723))

(declare-fun m!437725 () Bool)

(assert (=> b!298557 m!437725))

(check-sat (not b!298555) (not b!298557) (not start!66798) (not b!298553))

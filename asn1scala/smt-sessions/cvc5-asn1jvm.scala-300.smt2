; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5972 () Bool)

(assert start!5972)

(declare-fun b!27048 () Bool)

(declare-fun res!23378 () Bool)

(declare-fun e!18315 () Bool)

(assert (=> b!27048 (=> res!23378 e!18315)))

(declare-datatypes ((array!1709 0))(
  ( (array!1710 (arr!1199 (Array (_ BitVec 32) (_ BitVec 8))) (size!737 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1306 0))(
  ( (BitStream!1307 (buf!1064 array!1709) (currentByte!2389 (_ BitVec 32)) (currentBit!2384 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2177 0))(
  ( (Unit!2178) )
))
(declare-datatypes ((tuple2!2978 0))(
  ( (tuple2!2979 (_1!1576 Unit!2177) (_2!1576 BitStream!1306)) )
))
(declare-fun lt!38638 () tuple2!2978)

(declare-fun lt!38641 () tuple2!2978)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27048 (= res!23378 (not (invariant!0 (currentBit!2384 (_2!1576 lt!38638)) (currentByte!2389 (_2!1576 lt!38638)) (size!737 (buf!1064 (_2!1576 lt!38641))))))))

(declare-fun b!27049 () Bool)

(declare-fun e!18312 () Bool)

(declare-fun e!18310 () Bool)

(assert (=> b!27049 (= e!18312 e!18310)))

(declare-fun res!23374 () Bool)

(assert (=> b!27049 (=> res!23374 e!18310)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!38633 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!38643 () (_ BitVec 64))

(assert (=> b!27049 (= res!23374 (not (= lt!38643 (bvsub (bvadd lt!38633 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27049 (= lt!38643 (bitIndex!0 (size!737 (buf!1064 (_2!1576 lt!38641))) (currentByte!2389 (_2!1576 lt!38641)) (currentBit!2384 (_2!1576 lt!38641))))))

(declare-fun b!27050 () Bool)

(declare-fun res!23373 () Bool)

(declare-fun e!18314 () Bool)

(assert (=> b!27050 (=> res!23373 e!18314)))

(declare-datatypes ((tuple2!2980 0))(
  ( (tuple2!2981 (_1!1577 BitStream!1306) (_2!1577 BitStream!1306)) )
))
(declare-fun lt!38648 () tuple2!2980)

(declare-fun lt!38650 () tuple2!2980)

(declare-fun isPrefixOf!0 (BitStream!1306 BitStream!1306) Bool)

(assert (=> b!27050 (= res!23373 (not (isPrefixOf!0 (_1!1577 lt!38648) (_1!1577 lt!38650))))))

(declare-fun b!27051 () Bool)

(declare-fun res!23377 () Bool)

(assert (=> b!27051 (=> res!23377 e!18314)))

(assert (=> b!27051 (= res!23377 (not (isPrefixOf!0 (_1!1577 lt!38648) (_2!1576 lt!38641))))))

(declare-fun b!27052 () Bool)

(assert (=> b!27052 (= e!18315 e!18314)))

(declare-fun res!23366 () Bool)

(assert (=> b!27052 (=> res!23366 e!18314)))

(assert (=> b!27052 (= res!23366 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!354 0))(
  ( (Nil!351) (Cons!350 (h!469 Bool) (t!1104 List!354)) )
))
(declare-fun lt!38647 () List!354)

(declare-fun lt!38637 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1306 BitStream!1306 (_ BitVec 64)) List!354)

(assert (=> b!27052 (= lt!38647 (bitStreamReadBitsIntoList!0 (_2!1576 lt!38641) (_1!1577 lt!38650) lt!38637))))

(declare-fun lt!38636 () List!354)

(assert (=> b!27052 (= lt!38636 (bitStreamReadBitsIntoList!0 (_2!1576 lt!38641) (_1!1577 lt!38648) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27052 (validate_offset_bits!1 ((_ sign_extend 32) (size!737 (buf!1064 (_2!1576 lt!38641)))) ((_ sign_extend 32) (currentByte!2389 (_2!1576 lt!38638))) ((_ sign_extend 32) (currentBit!2384 (_2!1576 lt!38638))) lt!38637)))

(declare-fun lt!38645 () Unit!2177)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1306 array!1709 (_ BitVec 64)) Unit!2177)

(assert (=> b!27052 (= lt!38645 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1576 lt!38638) (buf!1064 (_2!1576 lt!38641)) lt!38637))))

(declare-fun reader!0 (BitStream!1306 BitStream!1306) tuple2!2980)

(assert (=> b!27052 (= lt!38650 (reader!0 (_2!1576 lt!38638) (_2!1576 lt!38641)))))

(declare-fun thiss!1379 () BitStream!1306)

(assert (=> b!27052 (validate_offset_bits!1 ((_ sign_extend 32) (size!737 (buf!1064 (_2!1576 lt!38641)))) ((_ sign_extend 32) (currentByte!2389 thiss!1379)) ((_ sign_extend 32) (currentBit!2384 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38646 () Unit!2177)

(assert (=> b!27052 (= lt!38646 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1064 (_2!1576 lt!38641)) (bvsub to!314 i!635)))))

(assert (=> b!27052 (= lt!38648 (reader!0 thiss!1379 (_2!1576 lt!38641)))))

(declare-fun e!18309 () Bool)

(declare-fun b!27053 () Bool)

(assert (=> b!27053 (= e!18309 (= lt!38643 (bvsub (bvsub (bvadd (bitIndex!0 (size!737 (buf!1064 (_2!1576 lt!38638))) (currentByte!2389 (_2!1576 lt!38638)) (currentBit!2384 (_2!1576 lt!38638))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27054 () Bool)

(assert (=> b!27054 (= e!18310 e!18315)))

(declare-fun res!23371 () Bool)

(assert (=> b!27054 (=> res!23371 e!18315)))

(assert (=> b!27054 (= res!23371 (not (= (size!737 (buf!1064 (_2!1576 lt!38638))) (size!737 (buf!1064 (_2!1576 lt!38641))))))))

(assert (=> b!27054 e!18309))

(declare-fun res!23367 () Bool)

(assert (=> b!27054 (=> (not res!23367) (not e!18309))))

(assert (=> b!27054 (= res!23367 (= (size!737 (buf!1064 (_2!1576 lt!38641))) (size!737 (buf!1064 thiss!1379))))))

(declare-fun b!27055 () Bool)

(declare-fun e!18308 () Bool)

(declare-fun e!18311 () Bool)

(assert (=> b!27055 (= e!18308 e!18311)))

(declare-fun res!23368 () Bool)

(assert (=> b!27055 (=> res!23368 e!18311)))

(assert (=> b!27055 (= res!23368 (not (isPrefixOf!0 thiss!1379 (_2!1576 lt!38638))))))

(assert (=> b!27055 (validate_offset_bits!1 ((_ sign_extend 32) (size!737 (buf!1064 (_2!1576 lt!38638)))) ((_ sign_extend 32) (currentByte!2389 (_2!1576 lt!38638))) ((_ sign_extend 32) (currentBit!2384 (_2!1576 lt!38638))) lt!38637)))

(assert (=> b!27055 (= lt!38637 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38634 () Unit!2177)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1306 BitStream!1306 (_ BitVec 64) (_ BitVec 64)) Unit!2177)

(assert (=> b!27055 (= lt!38634 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1576 lt!38638) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1709)

(declare-fun appendBitFromByte!0 (BitStream!1306 (_ BitVec 8) (_ BitVec 32)) tuple2!2978)

(assert (=> b!27055 (= lt!38638 (appendBitFromByte!0 thiss!1379 (select (arr!1199 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!27057 () Bool)

(declare-fun res!23382 () Bool)

(declare-fun e!18316 () Bool)

(assert (=> b!27057 (=> (not res!23382) (not e!18316))))

(assert (=> b!27057 (= res!23382 (validate_offset_bits!1 ((_ sign_extend 32) (size!737 (buf!1064 thiss!1379))) ((_ sign_extend 32) (currentByte!2389 thiss!1379)) ((_ sign_extend 32) (currentBit!2384 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun e!18305 () Bool)

(declare-fun b!27058 () Bool)

(declare-fun lt!38644 () tuple2!2980)

(declare-fun head!191 (List!354) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1306 array!1709 (_ BitVec 64) (_ BitVec 64)) List!354)

(assert (=> b!27058 (= e!18305 (= (head!191 (byteArrayBitContentToList!0 (_2!1576 lt!38638) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!191 (bitStreamReadBitsIntoList!0 (_2!1576 lt!38638) (_1!1577 lt!38644) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!27059 () Bool)

(declare-fun res!23364 () Bool)

(assert (=> b!27059 (=> res!23364 e!18314)))

(assert (=> b!27059 (= res!23364 (not (isPrefixOf!0 (_1!1577 lt!38650) (_2!1576 lt!38641))))))

(declare-fun b!27060 () Bool)

(declare-fun res!23375 () Bool)

(assert (=> b!27060 (=> res!23375 e!18310)))

(assert (=> b!27060 (= res!23375 (not (= (size!737 (buf!1064 thiss!1379)) (size!737 (buf!1064 (_2!1576 lt!38641))))))))

(declare-fun b!27061 () Bool)

(declare-fun e!18313 () Bool)

(declare-fun array_inv!706 (array!1709) Bool)

(assert (=> b!27061 (= e!18313 (array_inv!706 (buf!1064 thiss!1379)))))

(declare-fun b!27062 () Bool)

(declare-fun res!23380 () Bool)

(assert (=> b!27062 (=> res!23380 e!18314)))

(declare-fun length!80 (List!354) Int)

(assert (=> b!27062 (= res!23380 (<= (length!80 lt!38636) 0))))

(declare-fun b!27063 () Bool)

(assert (=> b!27063 (= e!18316 (not e!18308))))

(declare-fun res!23376 () Bool)

(assert (=> b!27063 (=> res!23376 e!18308)))

(assert (=> b!27063 (= res!23376 (bvsge i!635 to!314))))

(assert (=> b!27063 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38642 () Unit!2177)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1306) Unit!2177)

(assert (=> b!27063 (= lt!38642 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!27063 (= lt!38633 (bitIndex!0 (size!737 (buf!1064 thiss!1379)) (currentByte!2389 thiss!1379) (currentBit!2384 thiss!1379)))))

(declare-fun b!27056 () Bool)

(declare-fun res!23379 () Bool)

(assert (=> b!27056 (=> res!23379 e!18315)))

(assert (=> b!27056 (= res!23379 (not (invariant!0 (currentBit!2384 (_2!1576 lt!38638)) (currentByte!2389 (_2!1576 lt!38638)) (size!737 (buf!1064 (_2!1576 lt!38638))))))))

(declare-fun res!23370 () Bool)

(assert (=> start!5972 (=> (not res!23370) (not e!18316))))

(assert (=> start!5972 (= res!23370 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!737 srcBuffer!2))))))))

(assert (=> start!5972 e!18316))

(assert (=> start!5972 true))

(assert (=> start!5972 (array_inv!706 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1306) Bool)

(assert (=> start!5972 (and (inv!12 thiss!1379) e!18313)))

(declare-fun b!27064 () Bool)

(assert (=> b!27064 (= e!18311 e!18312)))

(declare-fun res!23381 () Bool)

(assert (=> b!27064 (=> res!23381 e!18312)))

(assert (=> b!27064 (= res!23381 (not (isPrefixOf!0 (_2!1576 lt!38638) (_2!1576 lt!38641))))))

(assert (=> b!27064 (isPrefixOf!0 thiss!1379 (_2!1576 lt!38641))))

(declare-fun lt!38639 () Unit!2177)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1306 BitStream!1306 BitStream!1306) Unit!2177)

(assert (=> b!27064 (= lt!38639 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1576 lt!38638) (_2!1576 lt!38641)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1306 array!1709 (_ BitVec 64) (_ BitVec 64)) tuple2!2978)

(assert (=> b!27064 (= lt!38641 (appendBitsMSBFirstLoop!0 (_2!1576 lt!38638) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!27064 e!18305))

(declare-fun res!23365 () Bool)

(assert (=> b!27064 (=> (not res!23365) (not e!18305))))

(assert (=> b!27064 (= res!23365 (validate_offset_bits!1 ((_ sign_extend 32) (size!737 (buf!1064 (_2!1576 lt!38638)))) ((_ sign_extend 32) (currentByte!2389 thiss!1379)) ((_ sign_extend 32) (currentBit!2384 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38649 () Unit!2177)

(assert (=> b!27064 (= lt!38649 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1064 (_2!1576 lt!38638)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!27064 (= lt!38644 (reader!0 thiss!1379 (_2!1576 lt!38638)))))

(declare-fun b!27065 () Bool)

(assert (=> b!27065 (= e!18314 true)))

(declare-fun lt!38640 () (_ BitVec 64))

(assert (=> b!27065 (= lt!38640 (bitIndex!0 (size!737 (buf!1064 (_1!1577 lt!38650))) (currentByte!2389 (_1!1577 lt!38650)) (currentBit!2384 (_1!1577 lt!38650))))))

(declare-fun lt!38635 () (_ BitVec 64))

(assert (=> b!27065 (= lt!38635 (bitIndex!0 (size!737 (buf!1064 (_1!1577 lt!38648))) (currentByte!2389 (_1!1577 lt!38648)) (currentBit!2384 (_1!1577 lt!38648))))))

(declare-fun b!27066 () Bool)

(declare-fun res!23372 () Bool)

(assert (=> b!27066 (=> res!23372 e!18310)))

(assert (=> b!27066 (= res!23372 (not (invariant!0 (currentBit!2384 (_2!1576 lt!38641)) (currentByte!2389 (_2!1576 lt!38641)) (size!737 (buf!1064 (_2!1576 lt!38641))))))))

(declare-fun b!27067 () Bool)

(declare-fun res!23369 () Bool)

(assert (=> b!27067 (=> res!23369 e!18314)))

(assert (=> b!27067 (= res!23369 (or (not (= (buf!1064 (_1!1577 lt!38648)) (buf!1064 (_1!1577 lt!38650)))) (not (= (buf!1064 (_1!1577 lt!38648)) (buf!1064 (_2!1576 lt!38641)))) (bvsge lt!38643 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(assert (= (and start!5972 res!23370) b!27057))

(assert (= (and b!27057 res!23382) b!27063))

(assert (= (and b!27063 (not res!23376)) b!27055))

(assert (= (and b!27055 (not res!23368)) b!27064))

(assert (= (and b!27064 res!23365) b!27058))

(assert (= (and b!27064 (not res!23381)) b!27049))

(assert (= (and b!27049 (not res!23374)) b!27066))

(assert (= (and b!27066 (not res!23372)) b!27060))

(assert (= (and b!27060 (not res!23375)) b!27054))

(assert (= (and b!27054 res!23367) b!27053))

(assert (= (and b!27054 (not res!23371)) b!27056))

(assert (= (and b!27056 (not res!23379)) b!27048))

(assert (= (and b!27048 (not res!23378)) b!27052))

(assert (= (and b!27052 (not res!23366)) b!27062))

(assert (= (and b!27062 (not res!23380)) b!27051))

(assert (= (and b!27051 (not res!23377)) b!27059))

(assert (= (and b!27059 (not res!23364)) b!27050))

(assert (= (and b!27050 (not res!23373)) b!27067))

(assert (= (and b!27067 (not res!23369)) b!27065))

(assert (= start!5972 b!27061))

(declare-fun m!38769 () Bool)

(assert (=> b!27065 m!38769))

(declare-fun m!38771 () Bool)

(assert (=> b!27065 m!38771))

(declare-fun m!38773 () Bool)

(assert (=> start!5972 m!38773))

(declare-fun m!38775 () Bool)

(assert (=> start!5972 m!38775))

(declare-fun m!38777 () Bool)

(assert (=> b!27061 m!38777))

(declare-fun m!38779 () Bool)

(assert (=> b!27057 m!38779))

(declare-fun m!38781 () Bool)

(assert (=> b!27064 m!38781))

(declare-fun m!38783 () Bool)

(assert (=> b!27064 m!38783))

(declare-fun m!38785 () Bool)

(assert (=> b!27064 m!38785))

(declare-fun m!38787 () Bool)

(assert (=> b!27064 m!38787))

(declare-fun m!38789 () Bool)

(assert (=> b!27064 m!38789))

(declare-fun m!38791 () Bool)

(assert (=> b!27064 m!38791))

(declare-fun m!38793 () Bool)

(assert (=> b!27064 m!38793))

(declare-fun m!38795 () Bool)

(assert (=> b!27066 m!38795))

(declare-fun m!38797 () Bool)

(assert (=> b!27059 m!38797))

(declare-fun m!38799 () Bool)

(assert (=> b!27052 m!38799))

(declare-fun m!38801 () Bool)

(assert (=> b!27052 m!38801))

(declare-fun m!38803 () Bool)

(assert (=> b!27052 m!38803))

(declare-fun m!38805 () Bool)

(assert (=> b!27052 m!38805))

(declare-fun m!38807 () Bool)

(assert (=> b!27052 m!38807))

(declare-fun m!38809 () Bool)

(assert (=> b!27052 m!38809))

(declare-fun m!38811 () Bool)

(assert (=> b!27052 m!38811))

(declare-fun m!38813 () Bool)

(assert (=> b!27052 m!38813))

(declare-fun m!38815 () Bool)

(assert (=> b!27053 m!38815))

(declare-fun m!38817 () Bool)

(assert (=> b!27063 m!38817))

(declare-fun m!38819 () Bool)

(assert (=> b!27063 m!38819))

(declare-fun m!38821 () Bool)

(assert (=> b!27063 m!38821))

(declare-fun m!38823 () Bool)

(assert (=> b!27062 m!38823))

(declare-fun m!38825 () Bool)

(assert (=> b!27056 m!38825))

(declare-fun m!38827 () Bool)

(assert (=> b!27051 m!38827))

(declare-fun m!38829 () Bool)

(assert (=> b!27050 m!38829))

(declare-fun m!38831 () Bool)

(assert (=> b!27055 m!38831))

(declare-fun m!38833 () Bool)

(assert (=> b!27055 m!38833))

(declare-fun m!38835 () Bool)

(assert (=> b!27055 m!38835))

(declare-fun m!38837 () Bool)

(assert (=> b!27055 m!38837))

(assert (=> b!27055 m!38833))

(declare-fun m!38839 () Bool)

(assert (=> b!27055 m!38839))

(declare-fun m!38841 () Bool)

(assert (=> b!27058 m!38841))

(assert (=> b!27058 m!38841))

(declare-fun m!38843 () Bool)

(assert (=> b!27058 m!38843))

(declare-fun m!38845 () Bool)

(assert (=> b!27058 m!38845))

(assert (=> b!27058 m!38845))

(declare-fun m!38847 () Bool)

(assert (=> b!27058 m!38847))

(declare-fun m!38849 () Bool)

(assert (=> b!27048 m!38849))

(declare-fun m!38851 () Bool)

(assert (=> b!27049 m!38851))

(push 1)


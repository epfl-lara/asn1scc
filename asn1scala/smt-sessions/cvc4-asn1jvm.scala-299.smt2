; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5970 () Bool)

(assert start!5970)

(declare-fun b!26988 () Bool)

(declare-fun res!23309 () Bool)

(declare-fun e!18275 () Bool)

(assert (=> b!26988 (=> res!23309 e!18275)))

(declare-datatypes ((array!1707 0))(
  ( (array!1708 (arr!1198 (Array (_ BitVec 32) (_ BitVec 8))) (size!736 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1304 0))(
  ( (BitStream!1305 (buf!1063 array!1707) (currentByte!2388 (_ BitVec 32)) (currentBit!2383 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2175 0))(
  ( (Unit!2176) )
))
(declare-datatypes ((tuple2!2974 0))(
  ( (tuple2!2975 (_1!1574 Unit!2175) (_2!1574 BitStream!1304)) )
))
(declare-fun lt!38580 () tuple2!2974)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26988 (= res!23309 (not (invariant!0 (currentBit!2383 (_2!1574 lt!38580)) (currentByte!2388 (_2!1574 lt!38580)) (size!736 (buf!1063 (_2!1574 lt!38580))))))))

(declare-fun b!26989 () Bool)

(declare-fun res!23317 () Bool)

(declare-fun e!18272 () Bool)

(assert (=> b!26989 (=> res!23317 e!18272)))

(declare-datatypes ((tuple2!2976 0))(
  ( (tuple2!2977 (_1!1575 BitStream!1304) (_2!1575 BitStream!1304)) )
))
(declare-fun lt!38587 () tuple2!2976)

(declare-fun isPrefixOf!0 (BitStream!1304 BitStream!1304) Bool)

(assert (=> b!26989 (= res!23317 (not (isPrefixOf!0 (_1!1575 lt!38587) (_2!1574 lt!38580))))))

(declare-fun b!26990 () Bool)

(assert (=> b!26990 (= e!18272 true)))

(declare-fun lt!38591 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26990 (= lt!38591 (bitIndex!0 (size!736 (buf!1063 (_1!1575 lt!38587))) (currentByte!2388 (_1!1575 lt!38587)) (currentBit!2383 (_1!1575 lt!38587))))))

(declare-fun lt!38592 () (_ BitVec 64))

(declare-fun lt!38588 () tuple2!2976)

(assert (=> b!26990 (= lt!38592 (bitIndex!0 (size!736 (buf!1063 (_1!1575 lt!38588))) (currentByte!2388 (_1!1575 lt!38588)) (currentBit!2383 (_1!1575 lt!38588))))))

(declare-fun b!26991 () Bool)

(declare-fun res!23314 () Bool)

(assert (=> b!26991 (=> res!23314 e!18272)))

(declare-datatypes ((List!353 0))(
  ( (Nil!350) (Cons!349 (h!468 Bool) (t!1103 List!353)) )
))
(declare-fun lt!38590 () List!353)

(declare-fun length!79 (List!353) Int)

(assert (=> b!26991 (= res!23314 (<= (length!79 lt!38590) 0))))

(declare-fun b!26992 () Bool)

(declare-fun res!23318 () Bool)

(declare-fun e!18271 () Bool)

(assert (=> b!26992 (=> res!23318 e!18271)))

(declare-fun lt!38593 () tuple2!2974)

(assert (=> b!26992 (= res!23318 (not (invariant!0 (currentBit!2383 (_2!1574 lt!38593)) (currentByte!2388 (_2!1574 lt!38593)) (size!736 (buf!1063 (_2!1574 lt!38580))))))))

(declare-fun res!23311 () Bool)

(declare-fun e!18276 () Bool)

(assert (=> start!5970 (=> (not res!23311) (not e!18276))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun srcBuffer!2 () array!1707)

(assert (=> start!5970 (= res!23311 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!736 srcBuffer!2))))))))

(assert (=> start!5970 e!18276))

(assert (=> start!5970 true))

(declare-fun array_inv!705 (array!1707) Bool)

(assert (=> start!5970 (array_inv!705 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!1304)

(declare-fun e!18280 () Bool)

(declare-fun inv!12 (BitStream!1304) Bool)

(assert (=> start!5970 (and (inv!12 thiss!1379) e!18280)))

(declare-fun b!26993 () Bool)

(assert (=> b!26993 (= e!18275 e!18271)))

(declare-fun res!23310 () Bool)

(assert (=> b!26993 (=> res!23310 e!18271)))

(assert (=> b!26993 (= res!23310 (not (= (size!736 (buf!1063 (_2!1574 lt!38593))) (size!736 (buf!1063 (_2!1574 lt!38580))))))))

(declare-fun e!18277 () Bool)

(assert (=> b!26993 e!18277))

(declare-fun res!23308 () Bool)

(assert (=> b!26993 (=> (not res!23308) (not e!18277))))

(assert (=> b!26993 (= res!23308 (= (size!736 (buf!1063 (_2!1574 lt!38580))) (size!736 (buf!1063 thiss!1379))))))

(declare-fun b!26994 () Bool)

(declare-fun lt!38586 () (_ BitVec 64))

(assert (=> b!26994 (= e!18277 (= lt!38586 (bvsub (bvsub (bvadd (bitIndex!0 (size!736 (buf!1063 (_2!1574 lt!38593))) (currentByte!2388 (_2!1574 lt!38593)) (currentBit!2383 (_2!1574 lt!38593))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!26995 () Bool)

(declare-fun e!18278 () Bool)

(declare-fun e!18274 () Bool)

(assert (=> b!26995 (= e!18278 e!18274)))

(declare-fun res!23316 () Bool)

(assert (=> b!26995 (=> res!23316 e!18274)))

(assert (=> b!26995 (= res!23316 (not (isPrefixOf!0 thiss!1379 (_2!1574 lt!38593))))))

(declare-fun lt!38595 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26995 (validate_offset_bits!1 ((_ sign_extend 32) (size!736 (buf!1063 (_2!1574 lt!38593)))) ((_ sign_extend 32) (currentByte!2388 (_2!1574 lt!38593))) ((_ sign_extend 32) (currentBit!2383 (_2!1574 lt!38593))) lt!38595)))

(assert (=> b!26995 (= lt!38595 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38581 () Unit!2175)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1304 BitStream!1304 (_ BitVec 64) (_ BitVec 64)) Unit!2175)

(assert (=> b!26995 (= lt!38581 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1574 lt!38593) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1304 (_ BitVec 8) (_ BitVec 32)) tuple2!2974)

(assert (=> b!26995 (= lt!38593 (appendBitFromByte!0 thiss!1379 (select (arr!1198 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!26996 () Bool)

(declare-fun res!23325 () Bool)

(assert (=> b!26996 (=> res!23325 e!18272)))

(assert (=> b!26996 (= res!23325 (not (isPrefixOf!0 (_1!1575 lt!38588) (_1!1575 lt!38587))))))

(declare-fun b!26997 () Bool)

(declare-fun res!23315 () Bool)

(assert (=> b!26997 (=> (not res!23315) (not e!18276))))

(assert (=> b!26997 (= res!23315 (validate_offset_bits!1 ((_ sign_extend 32) (size!736 (buf!1063 thiss!1379))) ((_ sign_extend 32) (currentByte!2388 thiss!1379)) ((_ sign_extend 32) (currentBit!2383 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!26998 () Bool)

(declare-fun e!18273 () Bool)

(assert (=> b!26998 (= e!18274 e!18273)))

(declare-fun res!23322 () Bool)

(assert (=> b!26998 (=> res!23322 e!18273)))

(assert (=> b!26998 (= res!23322 (not (isPrefixOf!0 (_2!1574 lt!38593) (_2!1574 lt!38580))))))

(assert (=> b!26998 (isPrefixOf!0 thiss!1379 (_2!1574 lt!38580))))

(declare-fun lt!38585 () Unit!2175)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1304 BitStream!1304 BitStream!1304) Unit!2175)

(assert (=> b!26998 (= lt!38585 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1574 lt!38593) (_2!1574 lt!38580)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1304 array!1707 (_ BitVec 64) (_ BitVec 64)) tuple2!2974)

(assert (=> b!26998 (= lt!38580 (appendBitsMSBFirstLoop!0 (_2!1574 lt!38593) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!18279 () Bool)

(assert (=> b!26998 e!18279))

(declare-fun res!23319 () Bool)

(assert (=> b!26998 (=> (not res!23319) (not e!18279))))

(assert (=> b!26998 (= res!23319 (validate_offset_bits!1 ((_ sign_extend 32) (size!736 (buf!1063 (_2!1574 lt!38593)))) ((_ sign_extend 32) (currentByte!2388 thiss!1379)) ((_ sign_extend 32) (currentBit!2383 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38596 () Unit!2175)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1304 array!1707 (_ BitVec 64)) Unit!2175)

(assert (=> b!26998 (= lt!38596 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1063 (_2!1574 lt!38593)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38582 () tuple2!2976)

(declare-fun reader!0 (BitStream!1304 BitStream!1304) tuple2!2976)

(assert (=> b!26998 (= lt!38582 (reader!0 thiss!1379 (_2!1574 lt!38593)))))

(declare-fun b!26999 () Bool)

(declare-fun res!23312 () Bool)

(assert (=> b!26999 (=> res!23312 e!18271)))

(assert (=> b!26999 (= res!23312 (not (invariant!0 (currentBit!2383 (_2!1574 lt!38593)) (currentByte!2388 (_2!1574 lt!38593)) (size!736 (buf!1063 (_2!1574 lt!38593))))))))

(declare-fun b!27000 () Bool)

(assert (=> b!27000 (= e!18276 (not e!18278))))

(declare-fun res!23313 () Bool)

(assert (=> b!27000 (=> res!23313 e!18278)))

(assert (=> b!27000 (= res!23313 (bvsge i!635 to!314))))

(assert (=> b!27000 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38589 () Unit!2175)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1304) Unit!2175)

(assert (=> b!27000 (= lt!38589 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!38594 () (_ BitVec 64))

(assert (=> b!27000 (= lt!38594 (bitIndex!0 (size!736 (buf!1063 thiss!1379)) (currentByte!2388 thiss!1379) (currentBit!2383 thiss!1379)))))

(declare-fun b!27001 () Bool)

(assert (=> b!27001 (= e!18271 e!18272)))

(declare-fun res!23323 () Bool)

(assert (=> b!27001 (=> res!23323 e!18272)))

(assert (=> b!27001 (= res!23323 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!38584 () List!353)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1304 BitStream!1304 (_ BitVec 64)) List!353)

(assert (=> b!27001 (= lt!38584 (bitStreamReadBitsIntoList!0 (_2!1574 lt!38580) (_1!1575 lt!38587) lt!38595))))

(assert (=> b!27001 (= lt!38590 (bitStreamReadBitsIntoList!0 (_2!1574 lt!38580) (_1!1575 lt!38588) (bvsub to!314 i!635)))))

(assert (=> b!27001 (validate_offset_bits!1 ((_ sign_extend 32) (size!736 (buf!1063 (_2!1574 lt!38580)))) ((_ sign_extend 32) (currentByte!2388 (_2!1574 lt!38593))) ((_ sign_extend 32) (currentBit!2383 (_2!1574 lt!38593))) lt!38595)))

(declare-fun lt!38579 () Unit!2175)

(assert (=> b!27001 (= lt!38579 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1574 lt!38593) (buf!1063 (_2!1574 lt!38580)) lt!38595))))

(assert (=> b!27001 (= lt!38587 (reader!0 (_2!1574 lt!38593) (_2!1574 lt!38580)))))

(assert (=> b!27001 (validate_offset_bits!1 ((_ sign_extend 32) (size!736 (buf!1063 (_2!1574 lt!38580)))) ((_ sign_extend 32) (currentByte!2388 thiss!1379)) ((_ sign_extend 32) (currentBit!2383 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38583 () Unit!2175)

(assert (=> b!27001 (= lt!38583 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1063 (_2!1574 lt!38580)) (bvsub to!314 i!635)))))

(assert (=> b!27001 (= lt!38588 (reader!0 thiss!1379 (_2!1574 lt!38580)))))

(declare-fun b!27002 () Bool)

(declare-fun head!190 (List!353) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1304 array!1707 (_ BitVec 64) (_ BitVec 64)) List!353)

(assert (=> b!27002 (= e!18279 (= (head!190 (byteArrayBitContentToList!0 (_2!1574 lt!38593) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!190 (bitStreamReadBitsIntoList!0 (_2!1574 lt!38593) (_1!1575 lt!38582) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!27003 () Bool)

(assert (=> b!27003 (= e!18280 (array_inv!705 (buf!1063 thiss!1379)))))

(declare-fun b!27004 () Bool)

(assert (=> b!27004 (= e!18273 e!18275)))

(declare-fun res!23307 () Bool)

(assert (=> b!27004 (=> res!23307 e!18275)))

(assert (=> b!27004 (= res!23307 (not (= lt!38586 (bvsub (bvadd lt!38594 to!314) i!635))))))

(assert (=> b!27004 (= lt!38586 (bitIndex!0 (size!736 (buf!1063 (_2!1574 lt!38580))) (currentByte!2388 (_2!1574 lt!38580)) (currentBit!2383 (_2!1574 lt!38580))))))

(declare-fun b!27005 () Bool)

(declare-fun res!23320 () Bool)

(assert (=> b!27005 (=> res!23320 e!18275)))

(assert (=> b!27005 (= res!23320 (not (= (size!736 (buf!1063 thiss!1379)) (size!736 (buf!1063 (_2!1574 lt!38580))))))))

(declare-fun b!27006 () Bool)

(declare-fun res!23324 () Bool)

(assert (=> b!27006 (=> res!23324 e!18272)))

(assert (=> b!27006 (= res!23324 (or (not (= (buf!1063 (_1!1575 lt!38588)) (buf!1063 (_1!1575 lt!38587)))) (not (= (buf!1063 (_1!1575 lt!38588)) (buf!1063 (_2!1574 lt!38580)))) (bvsge lt!38586 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!27007 () Bool)

(declare-fun res!23321 () Bool)

(assert (=> b!27007 (=> res!23321 e!18272)))

(assert (=> b!27007 (= res!23321 (not (isPrefixOf!0 (_1!1575 lt!38588) (_2!1574 lt!38580))))))

(assert (= (and start!5970 res!23311) b!26997))

(assert (= (and b!26997 res!23315) b!27000))

(assert (= (and b!27000 (not res!23313)) b!26995))

(assert (= (and b!26995 (not res!23316)) b!26998))

(assert (= (and b!26998 res!23319) b!27002))

(assert (= (and b!26998 (not res!23322)) b!27004))

(assert (= (and b!27004 (not res!23307)) b!26988))

(assert (= (and b!26988 (not res!23309)) b!27005))

(assert (= (and b!27005 (not res!23320)) b!26993))

(assert (= (and b!26993 res!23308) b!26994))

(assert (= (and b!26993 (not res!23310)) b!26999))

(assert (= (and b!26999 (not res!23312)) b!26992))

(assert (= (and b!26992 (not res!23318)) b!27001))

(assert (= (and b!27001 (not res!23323)) b!26991))

(assert (= (and b!26991 (not res!23314)) b!27007))

(assert (= (and b!27007 (not res!23321)) b!26989))

(assert (= (and b!26989 (not res!23317)) b!26996))

(assert (= (and b!26996 (not res!23325)) b!27006))

(assert (= (and b!27006 (not res!23324)) b!26990))

(assert (= start!5970 b!27003))

(declare-fun m!38685 () Bool)

(assert (=> b!27000 m!38685))

(declare-fun m!38687 () Bool)

(assert (=> b!27000 m!38687))

(declare-fun m!38689 () Bool)

(assert (=> b!27000 m!38689))

(declare-fun m!38691 () Bool)

(assert (=> b!27001 m!38691))

(declare-fun m!38693 () Bool)

(assert (=> b!27001 m!38693))

(declare-fun m!38695 () Bool)

(assert (=> b!27001 m!38695))

(declare-fun m!38697 () Bool)

(assert (=> b!27001 m!38697))

(declare-fun m!38699 () Bool)

(assert (=> b!27001 m!38699))

(declare-fun m!38701 () Bool)

(assert (=> b!27001 m!38701))

(declare-fun m!38703 () Bool)

(assert (=> b!27001 m!38703))

(declare-fun m!38705 () Bool)

(assert (=> b!27001 m!38705))

(declare-fun m!38707 () Bool)

(assert (=> b!26995 m!38707))

(declare-fun m!38709 () Bool)

(assert (=> b!26995 m!38709))

(declare-fun m!38711 () Bool)

(assert (=> b!26995 m!38711))

(declare-fun m!38713 () Bool)

(assert (=> b!26995 m!38713))

(assert (=> b!26995 m!38709))

(declare-fun m!38715 () Bool)

(assert (=> b!26995 m!38715))

(declare-fun m!38717 () Bool)

(assert (=> b!27004 m!38717))

(declare-fun m!38719 () Bool)

(assert (=> b!26994 m!38719))

(declare-fun m!38721 () Bool)

(assert (=> b!26988 m!38721))

(declare-fun m!38723 () Bool)

(assert (=> b!26992 m!38723))

(declare-fun m!38725 () Bool)

(assert (=> start!5970 m!38725))

(declare-fun m!38727 () Bool)

(assert (=> start!5970 m!38727))

(declare-fun m!38729 () Bool)

(assert (=> b!26996 m!38729))

(declare-fun m!38731 () Bool)

(assert (=> b!27003 m!38731))

(declare-fun m!38733 () Bool)

(assert (=> b!27007 m!38733))

(declare-fun m!38735 () Bool)

(assert (=> b!27002 m!38735))

(assert (=> b!27002 m!38735))

(declare-fun m!38737 () Bool)

(assert (=> b!27002 m!38737))

(declare-fun m!38739 () Bool)

(assert (=> b!27002 m!38739))

(assert (=> b!27002 m!38739))

(declare-fun m!38741 () Bool)

(assert (=> b!27002 m!38741))

(declare-fun m!38743 () Bool)

(assert (=> b!26997 m!38743))

(declare-fun m!38745 () Bool)

(assert (=> b!26999 m!38745))

(declare-fun m!38747 () Bool)

(assert (=> b!26989 m!38747))

(declare-fun m!38749 () Bool)

(assert (=> b!26990 m!38749))

(declare-fun m!38751 () Bool)

(assert (=> b!26990 m!38751))

(declare-fun m!38753 () Bool)

(assert (=> b!26991 m!38753))

(declare-fun m!38755 () Bool)

(assert (=> b!26998 m!38755))

(declare-fun m!38757 () Bool)

(assert (=> b!26998 m!38757))

(declare-fun m!38759 () Bool)

(assert (=> b!26998 m!38759))

(declare-fun m!38761 () Bool)

(assert (=> b!26998 m!38761))

(declare-fun m!38763 () Bool)

(assert (=> b!26998 m!38763))

(declare-fun m!38765 () Bool)

(assert (=> b!26998 m!38765))

(declare-fun m!38767 () Bool)

(assert (=> b!26998 m!38767))

(push 1)

(assert (not b!27001))

(assert (not b!27002))

(assert (not b!27007))

(assert (not b!26995))

(assert (not b!27004))

(assert (not b!26992))

(assert (not b!26989))

(assert (not b!26991))

(assert (not b!26998))

(assert (not b!27000))

(assert (not b!27003))

(assert (not b!26990))

(assert (not b!26994))

(assert (not b!26988))

(assert (not b!26997))

(assert (not start!5970))

(assert (not b!26996))

(assert (not b!26999))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


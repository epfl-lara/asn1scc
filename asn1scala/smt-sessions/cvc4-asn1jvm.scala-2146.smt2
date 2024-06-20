; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54646 () Bool)

(assert start!54646)

(declare-fun b!255880 () Bool)

(declare-fun e!177276 () Bool)

(declare-datatypes ((array!13793 0))(
  ( (array!13794 (arr!7038 (Array (_ BitVec 32) (_ BitVec 8))) (size!6051 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11024 0))(
  ( (BitStream!11025 (buf!6568 array!13793) (currentByte!12047 (_ BitVec 32)) (currentBit!12042 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21894 0))(
  ( (tuple2!21895 (_1!11881 BitStream!11024) (_2!11881 Bool)) )
))
(declare-fun lt!397363 () tuple2!21894)

(declare-fun lt!397359 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!255880 (= e!177276 (= (bitIndex!0 (size!6051 (buf!6568 (_1!11881 lt!397363))) (currentByte!12047 (_1!11881 lt!397363)) (currentBit!12042 (_1!11881 lt!397363))) lt!397359))))

(declare-fun b!255881 () Bool)

(declare-fun e!177271 () Bool)

(declare-fun e!177273 () Bool)

(assert (=> b!255881 (= e!177271 e!177273)))

(declare-fun res!214512 () Bool)

(assert (=> b!255881 (=> res!214512 e!177273)))

(declare-fun thiss!1005 () BitStream!11024)

(declare-datatypes ((Unit!18310 0))(
  ( (Unit!18311) )
))
(declare-datatypes ((tuple2!21896 0))(
  ( (tuple2!21897 (_1!11882 Unit!18310) (_2!11882 BitStream!11024)) )
))
(declare-fun lt!397374 () tuple2!21896)

(assert (=> b!255881 (= res!214512 (not (= (size!6051 (buf!6568 thiss!1005)) (size!6051 (buf!6568 (_2!11882 lt!397374))))))))

(declare-fun lt!397364 () tuple2!21894)

(declare-fun lt!397362 () tuple2!21894)

(declare-datatypes ((tuple2!21898 0))(
  ( (tuple2!21899 (_1!11883 BitStream!11024) (_2!11883 BitStream!11024)) )
))
(declare-fun lt!397376 () tuple2!21898)

(assert (=> b!255881 (and (= (_2!11881 lt!397364) (_2!11881 lt!397362)) (= (_1!11881 lt!397364) (_2!11883 lt!397376)))))

(declare-fun b!255883 () Bool)

(declare-fun e!177272 () Bool)

(declare-fun e!177275 () Bool)

(assert (=> b!255883 (= e!177272 e!177275)))

(declare-fun res!214518 () Bool)

(assert (=> b!255883 (=> (not res!214518) (not e!177275))))

(declare-fun lt!397370 () (_ BitVec 64))

(declare-fun lt!397365 () tuple2!21896)

(assert (=> b!255883 (= res!214518 (= (bitIndex!0 (size!6051 (buf!6568 (_2!11882 lt!397374))) (currentByte!12047 (_2!11882 lt!397374)) (currentBit!12042 (_2!11882 lt!397374))) (bvadd (bitIndex!0 (size!6051 (buf!6568 (_2!11882 lt!397365))) (currentByte!12047 (_2!11882 lt!397365)) (currentBit!12042 (_2!11882 lt!397365))) lt!397370)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!255883 (= lt!397370 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!255884 () Bool)

(declare-fun e!177270 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255884 (= e!177270 (invariant!0 (currentBit!12042 thiss!1005) (currentByte!12047 thiss!1005) (size!6051 (buf!6568 (_2!11882 lt!397374)))))))

(declare-fun b!255885 () Bool)

(declare-fun e!177274 () Bool)

(declare-fun e!177277 () Bool)

(assert (=> b!255885 (= e!177274 e!177277)))

(declare-fun res!214519 () Bool)

(assert (=> b!255885 (=> (not res!214519) (not e!177277))))

(declare-fun lt!397377 () (_ BitVec 64))

(assert (=> b!255885 (= res!214519 (= lt!397359 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!397377)))))

(assert (=> b!255885 (= lt!397359 (bitIndex!0 (size!6051 (buf!6568 (_2!11882 lt!397365))) (currentByte!12047 (_2!11882 lt!397365)) (currentBit!12042 (_2!11882 lt!397365))))))

(assert (=> b!255885 (= lt!397377 (bitIndex!0 (size!6051 (buf!6568 thiss!1005)) (currentByte!12047 thiss!1005) (currentBit!12042 thiss!1005)))))

(declare-fun b!255886 () Bool)

(declare-fun res!214523 () Bool)

(assert (=> b!255886 (=> (not res!214523) (not e!177270))))

(assert (=> b!255886 (= res!214523 (invariant!0 (currentBit!12042 thiss!1005) (currentByte!12047 thiss!1005) (size!6051 (buf!6568 (_2!11882 lt!397365)))))))

(declare-fun b!255887 () Bool)

(declare-fun res!214521 () Bool)

(assert (=> b!255887 (=> (not res!214521) (not e!177277))))

(declare-fun isPrefixOf!0 (BitStream!11024 BitStream!11024) Bool)

(assert (=> b!255887 (= res!214521 (isPrefixOf!0 thiss!1005 (_2!11882 lt!397365)))))

(declare-fun b!255888 () Bool)

(declare-fun res!214514 () Bool)

(assert (=> b!255888 (=> res!214514 e!177271)))

(declare-fun lt!397366 () tuple2!21898)

(declare-fun withMovedBitIndex!0 (BitStream!11024 (_ BitVec 64)) BitStream!11024)

(assert (=> b!255888 (= res!214514 (not (= (_1!11883 lt!397366) (withMovedBitIndex!0 (_1!11883 lt!397376) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!255889 () Bool)

(declare-fun res!214525 () Bool)

(declare-fun e!177278 () Bool)

(assert (=> b!255889 (=> (not res!214525) (not e!177278))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255889 (= res!214525 (validate_offset_bits!1 ((_ sign_extend 32) (size!6051 (buf!6568 thiss!1005))) ((_ sign_extend 32) (currentByte!12047 thiss!1005)) ((_ sign_extend 32) (currentBit!12042 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!214522 () Bool)

(assert (=> start!54646 (=> (not res!214522) (not e!177278))))

(assert (=> start!54646 (= res!214522 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54646 e!177278))

(assert (=> start!54646 true))

(declare-fun e!177268 () Bool)

(declare-fun inv!12 (BitStream!11024) Bool)

(assert (=> start!54646 (and (inv!12 thiss!1005) e!177268)))

(declare-fun b!255882 () Bool)

(declare-fun lt!397354 () tuple2!21894)

(declare-fun lt!397360 () tuple2!21898)

(assert (=> b!255882 (= e!177275 (not (or (not (_2!11881 lt!397354)) (not (= (_1!11881 lt!397354) (_2!11883 lt!397360))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!11024 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21894)

(assert (=> b!255882 (= lt!397354 (checkBitsLoopPure!0 (_1!11883 lt!397360) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255882 (validate_offset_bits!1 ((_ sign_extend 32) (size!6051 (buf!6568 (_2!11882 lt!397374)))) ((_ sign_extend 32) (currentByte!12047 (_2!11882 lt!397365))) ((_ sign_extend 32) (currentBit!12042 (_2!11882 lt!397365))) lt!397370)))

(declare-fun lt!397356 () Unit!18310)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11024 array!13793 (_ BitVec 64)) Unit!18310)

(assert (=> b!255882 (= lt!397356 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11882 lt!397365) (buf!6568 (_2!11882 lt!397374)) lt!397370))))

(declare-fun reader!0 (BitStream!11024 BitStream!11024) tuple2!21898)

(assert (=> b!255882 (= lt!397360 (reader!0 (_2!11882 lt!397365) (_2!11882 lt!397374)))))

(declare-fun b!255890 () Bool)

(declare-fun res!214524 () Bool)

(assert (=> b!255890 (=> (not res!214524) (not e!177278))))

(assert (=> b!255890 (= res!214524 (bvslt from!289 nBits!297))))

(declare-fun b!255891 () Bool)

(assert (=> b!255891 (= e!177277 e!177276)))

(declare-fun res!214515 () Bool)

(assert (=> b!255891 (=> (not res!214515) (not e!177276))))

(assert (=> b!255891 (= res!214515 (and (= (_2!11881 lt!397363) bit!26) (= (_1!11881 lt!397363) (_2!11882 lt!397365))))))

(declare-fun readBitPure!0 (BitStream!11024) tuple2!21894)

(declare-fun readerFrom!0 (BitStream!11024 (_ BitVec 32) (_ BitVec 32)) BitStream!11024)

(assert (=> b!255891 (= lt!397363 (readBitPure!0 (readerFrom!0 (_2!11882 lt!397365) (currentBit!12042 thiss!1005) (currentByte!12047 thiss!1005))))))

(declare-fun b!255892 () Bool)

(declare-fun array_inv!5792 (array!13793) Bool)

(assert (=> b!255892 (= e!177268 (array_inv!5792 (buf!6568 thiss!1005)))))

(declare-fun b!255893 () Bool)

(assert (=> b!255893 (= e!177278 (not e!177271))))

(declare-fun res!214520 () Bool)

(assert (=> b!255893 (=> res!214520 e!177271)))

(assert (=> b!255893 (= res!214520 (not (= (_1!11881 lt!397362) (_2!11883 lt!397366))))))

(assert (=> b!255893 (= lt!397362 (checkBitsLoopPure!0 (_1!11883 lt!397366) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!397355 () (_ BitVec 64))

(assert (=> b!255893 (validate_offset_bits!1 ((_ sign_extend 32) (size!6051 (buf!6568 (_2!11882 lt!397374)))) ((_ sign_extend 32) (currentByte!12047 (_2!11882 lt!397365))) ((_ sign_extend 32) (currentBit!12042 (_2!11882 lt!397365))) lt!397355)))

(declare-fun lt!397357 () Unit!18310)

(assert (=> b!255893 (= lt!397357 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11882 lt!397365) (buf!6568 (_2!11882 lt!397374)) lt!397355))))

(assert (=> b!255893 (= lt!397364 (checkBitsLoopPure!0 (_1!11883 lt!397376) nBits!297 bit!26 from!289))))

(assert (=> b!255893 (validate_offset_bits!1 ((_ sign_extend 32) (size!6051 (buf!6568 (_2!11882 lt!397374)))) ((_ sign_extend 32) (currentByte!12047 thiss!1005)) ((_ sign_extend 32) (currentBit!12042 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!397358 () Unit!18310)

(assert (=> b!255893 (= lt!397358 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6568 (_2!11882 lt!397374)) (bvsub nBits!297 from!289)))))

(assert (=> b!255893 (= (_2!11881 (readBitPure!0 (_1!11883 lt!397376))) bit!26)))

(assert (=> b!255893 (= lt!397366 (reader!0 (_2!11882 lt!397365) (_2!11882 lt!397374)))))

(assert (=> b!255893 (= lt!397376 (reader!0 thiss!1005 (_2!11882 lt!397374)))))

(declare-fun e!177267 () Bool)

(assert (=> b!255893 e!177267))

(declare-fun res!214516 () Bool)

(assert (=> b!255893 (=> (not res!214516) (not e!177267))))

(declare-fun lt!397367 () tuple2!21894)

(declare-fun lt!397372 () tuple2!21894)

(assert (=> b!255893 (= res!214516 (= (bitIndex!0 (size!6051 (buf!6568 (_1!11881 lt!397367))) (currentByte!12047 (_1!11881 lt!397367)) (currentBit!12042 (_1!11881 lt!397367))) (bitIndex!0 (size!6051 (buf!6568 (_1!11881 lt!397372))) (currentByte!12047 (_1!11881 lt!397372)) (currentBit!12042 (_1!11881 lt!397372)))))))

(declare-fun lt!397373 () Unit!18310)

(declare-fun lt!397368 () BitStream!11024)

(declare-fun readBitPrefixLemma!0 (BitStream!11024 BitStream!11024) Unit!18310)

(assert (=> b!255893 (= lt!397373 (readBitPrefixLemma!0 lt!397368 (_2!11882 lt!397374)))))

(assert (=> b!255893 (= lt!397372 (readBitPure!0 (BitStream!11025 (buf!6568 (_2!11882 lt!397374)) (currentByte!12047 thiss!1005) (currentBit!12042 thiss!1005))))))

(assert (=> b!255893 (= lt!397367 (readBitPure!0 lt!397368))))

(assert (=> b!255893 (= lt!397368 (BitStream!11025 (buf!6568 (_2!11882 lt!397365)) (currentByte!12047 thiss!1005) (currentBit!12042 thiss!1005)))))

(assert (=> b!255893 e!177270))

(declare-fun res!214527 () Bool)

(assert (=> b!255893 (=> (not res!214527) (not e!177270))))

(assert (=> b!255893 (= res!214527 (isPrefixOf!0 thiss!1005 (_2!11882 lt!397374)))))

(declare-fun lt!397371 () Unit!18310)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11024 BitStream!11024 BitStream!11024) Unit!18310)

(assert (=> b!255893 (= lt!397371 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11882 lt!397365) (_2!11882 lt!397374)))))

(assert (=> b!255893 e!177272))

(declare-fun res!214526 () Bool)

(assert (=> b!255893 (=> (not res!214526) (not e!177272))))

(assert (=> b!255893 (= res!214526 (= (size!6051 (buf!6568 (_2!11882 lt!397365))) (size!6051 (buf!6568 (_2!11882 lt!397374)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11024 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21896)

(assert (=> b!255893 (= lt!397374 (appendNBitsLoop!0 (_2!11882 lt!397365) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255893 (validate_offset_bits!1 ((_ sign_extend 32) (size!6051 (buf!6568 (_2!11882 lt!397365)))) ((_ sign_extend 32) (currentByte!12047 (_2!11882 lt!397365))) ((_ sign_extend 32) (currentBit!12042 (_2!11882 lt!397365))) lt!397355)))

(assert (=> b!255893 (= lt!397355 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!397361 () Unit!18310)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11024 BitStream!11024 (_ BitVec 64) (_ BitVec 64)) Unit!18310)

(assert (=> b!255893 (= lt!397361 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11882 lt!397365) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!255893 e!177274))

(declare-fun res!214517 () Bool)

(assert (=> b!255893 (=> (not res!214517) (not e!177274))))

(assert (=> b!255893 (= res!214517 (= (size!6051 (buf!6568 thiss!1005)) (size!6051 (buf!6568 (_2!11882 lt!397365)))))))

(declare-fun appendBit!0 (BitStream!11024 Bool) tuple2!21896)

(assert (=> b!255893 (= lt!397365 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255894 () Bool)

(assert (=> b!255894 (= e!177273 true)))

(declare-fun lt!397375 () (_ BitVec 64))

(assert (=> b!255894 (= lt!397375 (bitIndex!0 (size!6051 (buf!6568 (_2!11882 lt!397374))) (currentByte!12047 (_2!11882 lt!397374)) (currentBit!12042 (_2!11882 lt!397374))))))

(declare-fun lt!397369 () (_ BitVec 64))

(assert (=> b!255894 (= lt!397369 (bitIndex!0 (size!6051 (buf!6568 thiss!1005)) (currentByte!12047 thiss!1005) (currentBit!12042 thiss!1005)))))

(declare-fun b!255895 () Bool)

(declare-fun res!214513 () Bool)

(assert (=> b!255895 (=> (not res!214513) (not e!177275))))

(assert (=> b!255895 (= res!214513 (isPrefixOf!0 (_2!11882 lt!397365) (_2!11882 lt!397374)))))

(declare-fun b!255896 () Bool)

(assert (=> b!255896 (= e!177267 (= (_2!11881 lt!397367) (_2!11881 lt!397372)))))

(assert (= (and start!54646 res!214522) b!255889))

(assert (= (and b!255889 res!214525) b!255890))

(assert (= (and b!255890 res!214524) b!255893))

(assert (= (and b!255893 res!214517) b!255885))

(assert (= (and b!255885 res!214519) b!255887))

(assert (= (and b!255887 res!214521) b!255891))

(assert (= (and b!255891 res!214515) b!255880))

(assert (= (and b!255893 res!214526) b!255883))

(assert (= (and b!255883 res!214518) b!255895))

(assert (= (and b!255895 res!214513) b!255882))

(assert (= (and b!255893 res!214527) b!255886))

(assert (= (and b!255886 res!214523) b!255884))

(assert (= (and b!255893 res!214516) b!255896))

(assert (= (and b!255893 (not res!214520)) b!255888))

(assert (= (and b!255888 (not res!214514)) b!255881))

(assert (= (and b!255881 (not res!214512)) b!255894))

(assert (= start!54646 b!255892))

(declare-fun m!385429 () Bool)

(assert (=> b!255887 m!385429))

(declare-fun m!385431 () Bool)

(assert (=> b!255883 m!385431))

(declare-fun m!385433 () Bool)

(assert (=> b!255883 m!385433))

(declare-fun m!385435 () Bool)

(assert (=> start!54646 m!385435))

(declare-fun m!385437 () Bool)

(assert (=> b!255892 m!385437))

(declare-fun m!385439 () Bool)

(assert (=> b!255893 m!385439))

(declare-fun m!385441 () Bool)

(assert (=> b!255893 m!385441))

(declare-fun m!385443 () Bool)

(assert (=> b!255893 m!385443))

(declare-fun m!385445 () Bool)

(assert (=> b!255893 m!385445))

(declare-fun m!385447 () Bool)

(assert (=> b!255893 m!385447))

(declare-fun m!385449 () Bool)

(assert (=> b!255893 m!385449))

(declare-fun m!385451 () Bool)

(assert (=> b!255893 m!385451))

(declare-fun m!385453 () Bool)

(assert (=> b!255893 m!385453))

(declare-fun m!385455 () Bool)

(assert (=> b!255893 m!385455))

(declare-fun m!385457 () Bool)

(assert (=> b!255893 m!385457))

(declare-fun m!385459 () Bool)

(assert (=> b!255893 m!385459))

(declare-fun m!385461 () Bool)

(assert (=> b!255893 m!385461))

(declare-fun m!385463 () Bool)

(assert (=> b!255893 m!385463))

(declare-fun m!385465 () Bool)

(assert (=> b!255893 m!385465))

(declare-fun m!385467 () Bool)

(assert (=> b!255893 m!385467))

(declare-fun m!385469 () Bool)

(assert (=> b!255893 m!385469))

(declare-fun m!385471 () Bool)

(assert (=> b!255893 m!385471))

(declare-fun m!385473 () Bool)

(assert (=> b!255893 m!385473))

(declare-fun m!385475 () Bool)

(assert (=> b!255893 m!385475))

(declare-fun m!385477 () Bool)

(assert (=> b!255893 m!385477))

(declare-fun m!385479 () Bool)

(assert (=> b!255886 m!385479))

(declare-fun m!385481 () Bool)

(assert (=> b!255880 m!385481))

(declare-fun m!385483 () Bool)

(assert (=> b!255882 m!385483))

(declare-fun m!385485 () Bool)

(assert (=> b!255882 m!385485))

(declare-fun m!385487 () Bool)

(assert (=> b!255882 m!385487))

(assert (=> b!255882 m!385463))

(declare-fun m!385489 () Bool)

(assert (=> b!255888 m!385489))

(declare-fun m!385491 () Bool)

(assert (=> b!255891 m!385491))

(assert (=> b!255891 m!385491))

(declare-fun m!385493 () Bool)

(assert (=> b!255891 m!385493))

(declare-fun m!385495 () Bool)

(assert (=> b!255889 m!385495))

(declare-fun m!385497 () Bool)

(assert (=> b!255884 m!385497))

(assert (=> b!255885 m!385433))

(declare-fun m!385499 () Bool)

(assert (=> b!255885 m!385499))

(assert (=> b!255894 m!385431))

(assert (=> b!255894 m!385499))

(declare-fun m!385501 () Bool)

(assert (=> b!255895 m!385501))

(push 1)

(assert (not b!255893))

(assert (not b!255885))

(assert (not b!255895))

(assert (not b!255892))

(assert (not b!255886))

(assert (not b!255888))

(assert (not b!255887))

(assert (not b!255884))

(assert (not b!255891))

(assert (not b!255882))

(assert (not b!255889))

(assert (not start!54646))

(assert (not b!255883))

(assert (not b!255880))

(assert (not b!255894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


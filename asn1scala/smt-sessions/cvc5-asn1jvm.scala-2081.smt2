; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52742 () Bool)

(assert start!52742)

(declare-fun b!243949 () Bool)

(declare-fun e!169074 () Bool)

(declare-datatypes ((array!13361 0))(
  ( (array!13362 (arr!6844 (Array (_ BitVec 32) (_ BitVec 8))) (size!5857 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10636 0))(
  ( (BitStream!10637 (buf!6329 array!13361) (currentByte!11707 (_ BitVec 32)) (currentBit!11702 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20904 0))(
  ( (tuple2!20905 (_1!11374 BitStream!10636) (_2!11374 Bool)) )
))
(declare-fun lt!380266 () tuple2!20904)

(declare-fun lt!380272 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243949 (= e!169074 (= (bitIndex!0 (size!5857 (buf!6329 (_1!11374 lt!380266))) (currentByte!11707 (_1!11374 lt!380266)) (currentBit!11702 (_1!11374 lt!380266))) lt!380272))))

(declare-fun b!243950 () Bool)

(declare-fun res!203852 () Bool)

(declare-fun e!169077 () Bool)

(assert (=> b!243950 (=> (not res!203852) (not e!169077))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!243950 (= res!203852 (bvslt from!289 nBits!297))))

(declare-fun b!243952 () Bool)

(declare-fun res!203861 () Bool)

(assert (=> b!243952 (=> (not res!203861) (not e!169077))))

(declare-fun thiss!1005 () BitStream!10636)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243952 (= res!203861 (validate_offset_bits!1 ((_ sign_extend 32) (size!5857 (buf!6329 thiss!1005))) ((_ sign_extend 32) (currentByte!11707 thiss!1005)) ((_ sign_extend 32) (currentBit!11702 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!243953 () Bool)

(declare-fun res!203859 () Bool)

(declare-fun e!169076 () Bool)

(assert (=> b!243953 (=> (not res!203859) (not e!169076))))

(declare-datatypes ((Unit!17809 0))(
  ( (Unit!17810) )
))
(declare-datatypes ((tuple2!20906 0))(
  ( (tuple2!20907 (_1!11375 Unit!17809) (_2!11375 BitStream!10636)) )
))
(declare-fun lt!380265 () tuple2!20906)

(declare-fun isPrefixOf!0 (BitStream!10636 BitStream!10636) Bool)

(assert (=> b!243953 (= res!203859 (isPrefixOf!0 thiss!1005 (_2!11375 lt!380265)))))

(declare-fun b!243954 () Bool)

(declare-fun e!169078 () Bool)

(declare-fun lt!380263 () tuple2!20904)

(declare-datatypes ((tuple2!20908 0))(
  ( (tuple2!20909 (_1!11376 BitStream!10636) (_2!11376 BitStream!10636)) )
))
(declare-fun lt!380274 () tuple2!20908)

(assert (=> b!243954 (= e!169078 (not (or (not (_2!11374 lt!380263)) (not (= (_1!11374 lt!380263) (_2!11376 lt!380274))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10636 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20904)

(assert (=> b!243954 (= lt!380263 (checkBitsLoopPure!0 (_1!11376 lt!380274) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!380269 () tuple2!20906)

(declare-fun lt!380264 () (_ BitVec 64))

(assert (=> b!243954 (validate_offset_bits!1 ((_ sign_extend 32) (size!5857 (buf!6329 (_2!11375 lt!380269)))) ((_ sign_extend 32) (currentByte!11707 (_2!11375 lt!380265))) ((_ sign_extend 32) (currentBit!11702 (_2!11375 lt!380265))) lt!380264)))

(declare-fun lt!380262 () Unit!17809)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10636 array!13361 (_ BitVec 64)) Unit!17809)

(assert (=> b!243954 (= lt!380262 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11375 lt!380265) (buf!6329 (_2!11375 lt!380269)) lt!380264))))

(declare-fun reader!0 (BitStream!10636 BitStream!10636) tuple2!20908)

(assert (=> b!243954 (= lt!380274 (reader!0 (_2!11375 lt!380265) (_2!11375 lt!380269)))))

(declare-fun b!243955 () Bool)

(declare-fun res!203854 () Bool)

(declare-fun e!169075 () Bool)

(assert (=> b!243955 (=> (not res!203854) (not e!169075))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243955 (= res!203854 (invariant!0 (currentBit!11702 thiss!1005) (currentByte!11707 thiss!1005) (size!5857 (buf!6329 (_2!11375 lt!380265)))))))

(declare-fun b!243956 () Bool)

(assert (=> b!243956 (= e!169077 (not true))))

(declare-fun lt!380277 () tuple2!20908)

(declare-fun lt!380271 () tuple2!20904)

(assert (=> b!243956 (= lt!380271 (checkBitsLoopPure!0 (_1!11376 lt!380277) nBits!297 bit!26 from!289))))

(assert (=> b!243956 (validate_offset_bits!1 ((_ sign_extend 32) (size!5857 (buf!6329 (_2!11375 lt!380269)))) ((_ sign_extend 32) (currentByte!11707 thiss!1005)) ((_ sign_extend 32) (currentBit!11702 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!380270 () Unit!17809)

(assert (=> b!243956 (= lt!380270 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6329 (_2!11375 lt!380269)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10636) tuple2!20904)

(assert (=> b!243956 (= (_2!11374 (readBitPure!0 (_1!11376 lt!380277))) bit!26)))

(declare-fun lt!380280 () tuple2!20908)

(assert (=> b!243956 (= lt!380280 (reader!0 (_2!11375 lt!380265) (_2!11375 lt!380269)))))

(assert (=> b!243956 (= lt!380277 (reader!0 thiss!1005 (_2!11375 lt!380269)))))

(declare-fun e!169082 () Bool)

(assert (=> b!243956 e!169082))

(declare-fun res!203862 () Bool)

(assert (=> b!243956 (=> (not res!203862) (not e!169082))))

(declare-fun lt!380267 () tuple2!20904)

(declare-fun lt!380278 () tuple2!20904)

(assert (=> b!243956 (= res!203862 (= (bitIndex!0 (size!5857 (buf!6329 (_1!11374 lt!380267))) (currentByte!11707 (_1!11374 lt!380267)) (currentBit!11702 (_1!11374 lt!380267))) (bitIndex!0 (size!5857 (buf!6329 (_1!11374 lt!380278))) (currentByte!11707 (_1!11374 lt!380278)) (currentBit!11702 (_1!11374 lt!380278)))))))

(declare-fun lt!380279 () Unit!17809)

(declare-fun lt!380275 () BitStream!10636)

(declare-fun readBitPrefixLemma!0 (BitStream!10636 BitStream!10636) Unit!17809)

(assert (=> b!243956 (= lt!380279 (readBitPrefixLemma!0 lt!380275 (_2!11375 lt!380269)))))

(assert (=> b!243956 (= lt!380278 (readBitPure!0 (BitStream!10637 (buf!6329 (_2!11375 lt!380269)) (currentByte!11707 thiss!1005) (currentBit!11702 thiss!1005))))))

(assert (=> b!243956 (= lt!380267 (readBitPure!0 lt!380275))))

(assert (=> b!243956 (= lt!380275 (BitStream!10637 (buf!6329 (_2!11375 lt!380265)) (currentByte!11707 thiss!1005) (currentBit!11702 thiss!1005)))))

(assert (=> b!243956 e!169075))

(declare-fun res!203855 () Bool)

(assert (=> b!243956 (=> (not res!203855) (not e!169075))))

(assert (=> b!243956 (= res!203855 (isPrefixOf!0 thiss!1005 (_2!11375 lt!380269)))))

(declare-fun lt!380276 () Unit!17809)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10636 BitStream!10636 BitStream!10636) Unit!17809)

(assert (=> b!243956 (= lt!380276 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11375 lt!380265) (_2!11375 lt!380269)))))

(declare-fun e!169079 () Bool)

(assert (=> b!243956 e!169079))

(declare-fun res!203857 () Bool)

(assert (=> b!243956 (=> (not res!203857) (not e!169079))))

(assert (=> b!243956 (= res!203857 (= (size!5857 (buf!6329 (_2!11375 lt!380265))) (size!5857 (buf!6329 (_2!11375 lt!380269)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10636 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20906)

(assert (=> b!243956 (= lt!380269 (appendNBitsLoop!0 (_2!11375 lt!380265) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243956 (validate_offset_bits!1 ((_ sign_extend 32) (size!5857 (buf!6329 (_2!11375 lt!380265)))) ((_ sign_extend 32) (currentByte!11707 (_2!11375 lt!380265))) ((_ sign_extend 32) (currentBit!11702 (_2!11375 lt!380265))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!380273 () Unit!17809)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10636 BitStream!10636 (_ BitVec 64) (_ BitVec 64)) Unit!17809)

(assert (=> b!243956 (= lt!380273 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11375 lt!380265) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!169073 () Bool)

(assert (=> b!243956 e!169073))

(declare-fun res!203856 () Bool)

(assert (=> b!243956 (=> (not res!203856) (not e!169073))))

(assert (=> b!243956 (= res!203856 (= (size!5857 (buf!6329 thiss!1005)) (size!5857 (buf!6329 (_2!11375 lt!380265)))))))

(declare-fun appendBit!0 (BitStream!10636 Bool) tuple2!20906)

(assert (=> b!243956 (= lt!380265 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243957 () Bool)

(declare-fun res!203853 () Bool)

(assert (=> b!243957 (=> (not res!203853) (not e!169078))))

(assert (=> b!243957 (= res!203853 (isPrefixOf!0 (_2!11375 lt!380265) (_2!11375 lt!380269)))))

(declare-fun b!243958 () Bool)

(declare-fun e!169081 () Bool)

(declare-fun array_inv!5598 (array!13361) Bool)

(assert (=> b!243958 (= e!169081 (array_inv!5598 (buf!6329 thiss!1005)))))

(declare-fun b!243959 () Bool)

(assert (=> b!243959 (= e!169073 e!169076)))

(declare-fun res!203851 () Bool)

(assert (=> b!243959 (=> (not res!203851) (not e!169076))))

(declare-fun lt!380268 () (_ BitVec 64))

(assert (=> b!243959 (= res!203851 (= lt!380272 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!380268)))))

(assert (=> b!243959 (= lt!380272 (bitIndex!0 (size!5857 (buf!6329 (_2!11375 lt!380265))) (currentByte!11707 (_2!11375 lt!380265)) (currentBit!11702 (_2!11375 lt!380265))))))

(assert (=> b!243959 (= lt!380268 (bitIndex!0 (size!5857 (buf!6329 thiss!1005)) (currentByte!11707 thiss!1005) (currentBit!11702 thiss!1005)))))

(declare-fun b!243960 () Bool)

(assert (=> b!243960 (= e!169076 e!169074)))

(declare-fun res!203860 () Bool)

(assert (=> b!243960 (=> (not res!203860) (not e!169074))))

(assert (=> b!243960 (= res!203860 (and (= (_2!11374 lt!380266) bit!26) (= (_1!11374 lt!380266) (_2!11375 lt!380265))))))

(declare-fun readerFrom!0 (BitStream!10636 (_ BitVec 32) (_ BitVec 32)) BitStream!10636)

(assert (=> b!243960 (= lt!380266 (readBitPure!0 (readerFrom!0 (_2!11375 lt!380265) (currentBit!11702 thiss!1005) (currentByte!11707 thiss!1005))))))

(declare-fun res!203858 () Bool)

(assert (=> start!52742 (=> (not res!203858) (not e!169077))))

(assert (=> start!52742 (= res!203858 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52742 e!169077))

(assert (=> start!52742 true))

(declare-fun inv!12 (BitStream!10636) Bool)

(assert (=> start!52742 (and (inv!12 thiss!1005) e!169081)))

(declare-fun b!243951 () Bool)

(assert (=> b!243951 (= e!169079 e!169078)))

(declare-fun res!203850 () Bool)

(assert (=> b!243951 (=> (not res!203850) (not e!169078))))

(assert (=> b!243951 (= res!203850 (= (bitIndex!0 (size!5857 (buf!6329 (_2!11375 lt!380269))) (currentByte!11707 (_2!11375 lt!380269)) (currentBit!11702 (_2!11375 lt!380269))) (bvadd (bitIndex!0 (size!5857 (buf!6329 (_2!11375 lt!380265))) (currentByte!11707 (_2!11375 lt!380265)) (currentBit!11702 (_2!11375 lt!380265))) lt!380264)))))

(assert (=> b!243951 (= lt!380264 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243961 () Bool)

(assert (=> b!243961 (= e!169082 (= (_2!11374 lt!380267) (_2!11374 lt!380278)))))

(declare-fun b!243962 () Bool)

(assert (=> b!243962 (= e!169075 (invariant!0 (currentBit!11702 thiss!1005) (currentByte!11707 thiss!1005) (size!5857 (buf!6329 (_2!11375 lt!380269)))))))

(assert (= (and start!52742 res!203858) b!243952))

(assert (= (and b!243952 res!203861) b!243950))

(assert (= (and b!243950 res!203852) b!243956))

(assert (= (and b!243956 res!203856) b!243959))

(assert (= (and b!243959 res!203851) b!243953))

(assert (= (and b!243953 res!203859) b!243960))

(assert (= (and b!243960 res!203860) b!243949))

(assert (= (and b!243956 res!203857) b!243951))

(assert (= (and b!243951 res!203850) b!243957))

(assert (= (and b!243957 res!203853) b!243954))

(assert (= (and b!243956 res!203855) b!243955))

(assert (= (and b!243955 res!203854) b!243962))

(assert (= (and b!243956 res!203862) b!243961))

(assert (= start!52742 b!243958))

(declare-fun m!367625 () Bool)

(assert (=> b!243951 m!367625))

(declare-fun m!367627 () Bool)

(assert (=> b!243951 m!367627))

(declare-fun m!367629 () Bool)

(assert (=> b!243962 m!367629))

(declare-fun m!367631 () Bool)

(assert (=> b!243952 m!367631))

(assert (=> b!243959 m!367627))

(declare-fun m!367633 () Bool)

(assert (=> b!243959 m!367633))

(declare-fun m!367635 () Bool)

(assert (=> b!243960 m!367635))

(assert (=> b!243960 m!367635))

(declare-fun m!367637 () Bool)

(assert (=> b!243960 m!367637))

(declare-fun m!367639 () Bool)

(assert (=> b!243956 m!367639))

(declare-fun m!367641 () Bool)

(assert (=> b!243956 m!367641))

(declare-fun m!367643 () Bool)

(assert (=> b!243956 m!367643))

(declare-fun m!367645 () Bool)

(assert (=> b!243956 m!367645))

(declare-fun m!367647 () Bool)

(assert (=> b!243956 m!367647))

(declare-fun m!367649 () Bool)

(assert (=> b!243956 m!367649))

(declare-fun m!367651 () Bool)

(assert (=> b!243956 m!367651))

(declare-fun m!367653 () Bool)

(assert (=> b!243956 m!367653))

(declare-fun m!367655 () Bool)

(assert (=> b!243956 m!367655))

(declare-fun m!367657 () Bool)

(assert (=> b!243956 m!367657))

(declare-fun m!367659 () Bool)

(assert (=> b!243956 m!367659))

(declare-fun m!367661 () Bool)

(assert (=> b!243956 m!367661))

(declare-fun m!367663 () Bool)

(assert (=> b!243956 m!367663))

(declare-fun m!367665 () Bool)

(assert (=> b!243956 m!367665))

(declare-fun m!367667 () Bool)

(assert (=> b!243956 m!367667))

(declare-fun m!367669 () Bool)

(assert (=> b!243956 m!367669))

(declare-fun m!367671 () Bool)

(assert (=> b!243956 m!367671))

(declare-fun m!367673 () Bool)

(assert (=> b!243958 m!367673))

(declare-fun m!367675 () Bool)

(assert (=> b!243954 m!367675))

(declare-fun m!367677 () Bool)

(assert (=> b!243954 m!367677))

(declare-fun m!367679 () Bool)

(assert (=> b!243954 m!367679))

(assert (=> b!243954 m!367641))

(declare-fun m!367681 () Bool)

(assert (=> b!243957 m!367681))

(declare-fun m!367683 () Bool)

(assert (=> b!243949 m!367683))

(declare-fun m!367685 () Bool)

(assert (=> start!52742 m!367685))

(declare-fun m!367687 () Bool)

(assert (=> b!243955 m!367687))

(declare-fun m!367689 () Bool)

(assert (=> b!243953 m!367689))

(push 1)

(assert (not b!243954))

(assert (not b!243960))

(assert (not b!243949))

(assert (not b!243962))

(assert (not b!243953))

(assert (not b!243952))

(assert (not b!243958))

(assert (not b!243959))

(assert (not b!243955))

(assert (not start!52742))

(assert (not b!243951))

(assert (not b!243956))

(assert (not b!243957))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


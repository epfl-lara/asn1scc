; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21742 () Bool)

(assert start!21742)

(declare-fun b!109910 () Bool)

(declare-fun e!72033 () Bool)

(declare-datatypes ((array!5000 0))(
  ( (array!5001 (arr!2868 (Array (_ BitVec 32) (_ BitVec 8))) (size!2275 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4024 0))(
  ( (BitStream!4025 (buf!2669 array!5000) (currentByte!5211 (_ BitVec 32)) (currentBit!5206 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4024)

(declare-fun array_inv!2077 (array!5000) Bool)

(assert (=> b!109910 (= e!72033 (array_inv!2077 (buf!2669 thiss!1305)))))

(declare-fun b!109911 () Bool)

(declare-fun res!90714 () Bool)

(declare-fun e!72032 () Bool)

(assert (=> b!109911 (=> (not res!90714) (not e!72032))))

(declare-datatypes ((Unit!6715 0))(
  ( (Unit!6716) )
))
(declare-datatypes ((tuple2!9144 0))(
  ( (tuple2!9145 (_1!4829 Unit!6715) (_2!4829 BitStream!4024)) )
))
(declare-fun lt!166725 () tuple2!9144)

(declare-fun isPrefixOf!0 (BitStream!4024 BitStream!4024) Bool)

(assert (=> b!109911 (= res!90714 (isPrefixOf!0 thiss!1305 (_2!4829 lt!166725)))))

(declare-fun b!109912 () Bool)

(declare-fun e!72026 () Bool)

(declare-fun e!72030 () Bool)

(assert (=> b!109912 (= e!72026 (not e!72030))))

(declare-fun res!90724 () Bool)

(assert (=> b!109912 (=> res!90724 e!72030)))

(declare-datatypes ((tuple2!9146 0))(
  ( (tuple2!9147 (_1!4830 BitStream!4024) (_2!4830 (_ BitVec 64))) )
))
(declare-fun lt!166703 () tuple2!9146)

(declare-datatypes ((tuple2!9148 0))(
  ( (tuple2!9149 (_1!4831 BitStream!4024) (_2!4831 BitStream!4024)) )
))
(declare-fun lt!166706 () tuple2!9148)

(assert (=> b!109912 (= res!90724 (not (= (_1!4830 lt!166703) (_2!4831 lt!166706))))))

(declare-fun lt!166720 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9146)

(assert (=> b!109912 (= lt!166703 (readNLeastSignificantBitsLoopPure!0 (_1!4831 lt!166706) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166720))))

(declare-fun lt!166716 () tuple2!9144)

(declare-fun lt!166700 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109912 (validate_offset_bits!1 ((_ sign_extend 32) (size!2275 (buf!2669 (_2!4829 lt!166716)))) ((_ sign_extend 32) (currentByte!5211 (_2!4829 lt!166725))) ((_ sign_extend 32) (currentBit!5206 (_2!4829 lt!166725))) lt!166700)))

(declare-fun lt!166730 () Unit!6715)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4024 array!5000 (_ BitVec 64)) Unit!6715)

(assert (=> b!109912 (= lt!166730 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4829 lt!166725) (buf!2669 (_2!4829 lt!166716)) lt!166700))))

(assert (=> b!109912 (= lt!166700 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!9150 0))(
  ( (tuple2!9151 (_1!4832 BitStream!4024) (_2!4832 Bool)) )
))
(declare-fun lt!166708 () tuple2!9150)

(declare-fun lt!166729 () (_ BitVec 64))

(declare-fun lt!166727 () (_ BitVec 64))

(assert (=> b!109912 (= lt!166720 (bvor lt!166727 (ite (_2!4832 lt!166708) lt!166729 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!166709 () tuple2!9146)

(declare-fun lt!166702 () tuple2!9148)

(assert (=> b!109912 (= lt!166709 (readNLeastSignificantBitsLoopPure!0 (_1!4831 lt!166702) nBits!396 i!615 lt!166727))))

(declare-fun lt!166701 () (_ BitVec 64))

(assert (=> b!109912 (validate_offset_bits!1 ((_ sign_extend 32) (size!2275 (buf!2669 (_2!4829 lt!166716)))) ((_ sign_extend 32) (currentByte!5211 thiss!1305)) ((_ sign_extend 32) (currentBit!5206 thiss!1305)) lt!166701)))

(declare-fun lt!166704 () Unit!6715)

(assert (=> b!109912 (= lt!166704 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2669 (_2!4829 lt!166716)) lt!166701))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!166721 () (_ BitVec 64))

(assert (=> b!109912 (= lt!166727 (bvand v!199 (bvnot lt!166721)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109912 (= lt!166721 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun lt!166723 () Bool)

(assert (=> b!109912 (= (_2!4832 lt!166708) lt!166723)))

(declare-fun readBitPure!0 (BitStream!4024) tuple2!9150)

(assert (=> b!109912 (= lt!166708 (readBitPure!0 (_1!4831 lt!166702)))))

(declare-fun reader!0 (BitStream!4024 BitStream!4024) tuple2!9148)

(assert (=> b!109912 (= lt!166706 (reader!0 (_2!4829 lt!166725) (_2!4829 lt!166716)))))

(assert (=> b!109912 (= lt!166702 (reader!0 thiss!1305 (_2!4829 lt!166716)))))

(declare-fun e!72031 () Bool)

(assert (=> b!109912 e!72031))

(declare-fun res!90713 () Bool)

(assert (=> b!109912 (=> (not res!90713) (not e!72031))))

(declare-fun lt!166722 () tuple2!9150)

(declare-fun lt!166726 () tuple2!9150)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109912 (= res!90713 (= (bitIndex!0 (size!2275 (buf!2669 (_1!4832 lt!166722))) (currentByte!5211 (_1!4832 lt!166722)) (currentBit!5206 (_1!4832 lt!166722))) (bitIndex!0 (size!2275 (buf!2669 (_1!4832 lt!166726))) (currentByte!5211 (_1!4832 lt!166726)) (currentBit!5206 (_1!4832 lt!166726)))))))

(declare-fun lt!166717 () Unit!6715)

(declare-fun lt!166719 () BitStream!4024)

(declare-fun readBitPrefixLemma!0 (BitStream!4024 BitStream!4024) Unit!6715)

(assert (=> b!109912 (= lt!166717 (readBitPrefixLemma!0 lt!166719 (_2!4829 lt!166716)))))

(assert (=> b!109912 (= lt!166726 (readBitPure!0 (BitStream!4025 (buf!2669 (_2!4829 lt!166716)) (currentByte!5211 thiss!1305) (currentBit!5206 thiss!1305))))))

(assert (=> b!109912 (= lt!166722 (readBitPure!0 lt!166719))))

(assert (=> b!109912 (= lt!166719 (BitStream!4025 (buf!2669 (_2!4829 lt!166725)) (currentByte!5211 thiss!1305) (currentBit!5206 thiss!1305)))))

(declare-fun e!72035 () Bool)

(assert (=> b!109912 e!72035))

(declare-fun res!90715 () Bool)

(assert (=> b!109912 (=> (not res!90715) (not e!72035))))

(assert (=> b!109912 (= res!90715 (isPrefixOf!0 thiss!1305 (_2!4829 lt!166716)))))

(declare-fun lt!166728 () Unit!6715)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4024 BitStream!4024 BitStream!4024) Unit!6715)

(assert (=> b!109912 (= lt!166728 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4829 lt!166725) (_2!4829 lt!166716)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4024 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9144)

(assert (=> b!109912 (= lt!166716 (appendNLeastSignificantBitsLoop!0 (_2!4829 lt!166725) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!72028 () Bool)

(assert (=> b!109912 e!72028))

(declare-fun res!90721 () Bool)

(assert (=> b!109912 (=> (not res!90721) (not e!72028))))

(assert (=> b!109912 (= res!90721 (= (size!2275 (buf!2669 thiss!1305)) (size!2275 (buf!2669 (_2!4829 lt!166725)))))))

(declare-fun appendBit!0 (BitStream!4024 Bool) tuple2!9144)

(assert (=> b!109912 (= lt!166725 (appendBit!0 thiss!1305 lt!166723))))

(assert (=> b!109912 (= lt!166723 (not (= (bvand v!199 lt!166729) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109912 (= lt!166729 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!109913 () Bool)

(declare-fun e!72037 () Bool)

(assert (=> b!109913 (= e!72037 e!72026)))

(declare-fun res!90722 () Bool)

(assert (=> b!109913 (=> (not res!90722) (not e!72026))))

(declare-fun lt!166715 () (_ BitVec 64))

(assert (=> b!109913 (= res!90722 (and (= (bvand v!199 lt!166715) v!199) (bvslt i!615 nBits!396)))))

(assert (=> b!109913 (= lt!166715 (onesLSBLong!0 nBits!396))))

(declare-fun res!90716 () Bool)

(declare-fun e!72034 () Bool)

(assert (=> start!21742 (=> (not res!90716) (not e!72034))))

(assert (=> start!21742 (= res!90716 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21742 e!72034))

(assert (=> start!21742 true))

(declare-fun inv!12 (BitStream!4024) Bool)

(assert (=> start!21742 (and (inv!12 thiss!1305) e!72033)))

(declare-fun b!109914 () Bool)

(declare-fun e!72036 () Bool)

(assert (=> b!109914 (= e!72036 (or (not (= (bvand lt!166727 lt!166721) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!166727 lt!166715) lt!166727)))))

(declare-fun b!109915 () Bool)

(assert (=> b!109915 (= e!72030 e!72036)))

(declare-fun res!90717 () Bool)

(assert (=> b!109915 (=> res!90717 e!72036)))

(declare-fun lt!166724 () BitStream!4024)

(declare-fun lt!166718 () (_ BitVec 64))

(declare-fun lt!166714 () (_ BitVec 64))

(assert (=> b!109915 (= res!90717 (or (not (= (_1!4831 lt!166706) lt!166724)) (not (= (size!2275 (buf!2669 thiss!1305)) (size!2275 (buf!2669 (_2!4829 lt!166716))))) (not (= lt!166714 (bvadd lt!166718 lt!166701)))))))

(declare-fun e!72038 () Bool)

(assert (=> b!109915 e!72038))

(declare-fun res!90712 () Bool)

(assert (=> b!109915 (=> (not res!90712) (not e!72038))))

(declare-fun lt!166713 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4024 (_ BitVec 64)) BitStream!4024)

(assert (=> b!109915 (= res!90712 (= (_1!4831 lt!166706) (withMovedBitIndex!0 (_2!4831 lt!166706) (bvsub lt!166713 lt!166714))))))

(assert (=> b!109915 (= lt!166713 (bitIndex!0 (size!2275 (buf!2669 (_2!4829 lt!166725))) (currentByte!5211 (_2!4829 lt!166725)) (currentBit!5206 (_2!4829 lt!166725))))))

(assert (=> b!109915 (= (_1!4831 lt!166702) (withMovedBitIndex!0 (_2!4831 lt!166702) (bvsub lt!166718 lt!166714)))))

(assert (=> b!109915 (= lt!166714 (bitIndex!0 (size!2275 (buf!2669 (_2!4829 lt!166716))) (currentByte!5211 (_2!4829 lt!166716)) (currentBit!5206 (_2!4829 lt!166716))))))

(assert (=> b!109915 (= lt!166718 (bitIndex!0 (size!2275 (buf!2669 thiss!1305)) (currentByte!5211 thiss!1305) (currentBit!5206 thiss!1305)))))

(declare-fun lt!166711 () tuple2!9146)

(assert (=> b!109915 (and (= (_2!4830 lt!166709) (_2!4830 lt!166711)) (= (_1!4830 lt!166709) (_1!4830 lt!166711)))))

(declare-fun lt!166707 () Unit!6715)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6715)

(assert (=> b!109915 (= lt!166707 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4831 lt!166702) nBits!396 i!615 lt!166727))))

(assert (=> b!109915 (= lt!166711 (readNLeastSignificantBitsLoopPure!0 lt!166724 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166720))))

(assert (=> b!109915 (= lt!166724 (withMovedBitIndex!0 (_1!4831 lt!166702) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!109916 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109916 (= e!72035 (invariant!0 (currentBit!5206 thiss!1305) (currentByte!5211 thiss!1305) (size!2275 (buf!2669 (_2!4829 lt!166716)))))))

(declare-fun b!109917 () Bool)

(declare-fun res!90719 () Bool)

(assert (=> b!109917 (=> (not res!90719) (not e!72035))))

(assert (=> b!109917 (= res!90719 (invariant!0 (currentBit!5206 thiss!1305) (currentByte!5211 thiss!1305) (size!2275 (buf!2669 (_2!4829 lt!166725)))))))

(declare-fun b!109918 () Bool)

(assert (=> b!109918 (= e!72038 (and (= lt!166718 (bvsub lt!166713 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4831 lt!166706) lt!166724)) (and (= (_2!4830 lt!166709) (_2!4830 lt!166703)) (= (_1!4830 lt!166709) (_2!4831 lt!166702))))))))

(declare-fun b!109919 () Bool)

(assert (=> b!109919 (= e!72034 e!72037)))

(declare-fun res!90711 () Bool)

(assert (=> b!109919 (=> (not res!90711) (not e!72037))))

(assert (=> b!109919 (= res!90711 (validate_offset_bits!1 ((_ sign_extend 32) (size!2275 (buf!2669 thiss!1305))) ((_ sign_extend 32) (currentByte!5211 thiss!1305)) ((_ sign_extend 32) (currentBit!5206 thiss!1305)) lt!166701))))

(assert (=> b!109919 (= lt!166701 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!109920 () Bool)

(declare-fun e!72027 () Bool)

(declare-fun lt!166712 () tuple2!9150)

(declare-fun lt!166710 () (_ BitVec 64))

(assert (=> b!109920 (= e!72027 (= (bitIndex!0 (size!2275 (buf!2669 (_1!4832 lt!166712))) (currentByte!5211 (_1!4832 lt!166712)) (currentBit!5206 (_1!4832 lt!166712))) lt!166710))))

(declare-fun b!109921 () Bool)

(assert (=> b!109921 (= e!72032 e!72027)))

(declare-fun res!90723 () Bool)

(assert (=> b!109921 (=> (not res!90723) (not e!72027))))

(assert (=> b!109921 (= res!90723 (and (= (_2!4832 lt!166712) lt!166723) (= (_1!4832 lt!166712) (_2!4829 lt!166725))))))

(declare-fun readerFrom!0 (BitStream!4024 (_ BitVec 32) (_ BitVec 32)) BitStream!4024)

(assert (=> b!109921 (= lt!166712 (readBitPure!0 (readerFrom!0 (_2!4829 lt!166725) (currentBit!5206 thiss!1305) (currentByte!5211 thiss!1305))))))

(declare-fun b!109922 () Bool)

(declare-fun res!90718 () Bool)

(assert (=> b!109922 (=> res!90718 e!72036)))

(assert (=> b!109922 (= res!90718 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2275 (buf!2669 (_1!4831 lt!166702)))) ((_ sign_extend 32) (currentByte!5211 (_1!4831 lt!166702))) ((_ sign_extend 32) (currentBit!5206 (_1!4831 lt!166702))) lt!166701)))))

(declare-fun b!109923 () Bool)

(assert (=> b!109923 (= e!72028 e!72032)))

(declare-fun res!90720 () Bool)

(assert (=> b!109923 (=> (not res!90720) (not e!72032))))

(declare-fun lt!166705 () (_ BitVec 64))

(assert (=> b!109923 (= res!90720 (= lt!166710 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!166705)))))

(assert (=> b!109923 (= lt!166710 (bitIndex!0 (size!2275 (buf!2669 (_2!4829 lt!166725))) (currentByte!5211 (_2!4829 lt!166725)) (currentBit!5206 (_2!4829 lt!166725))))))

(assert (=> b!109923 (= lt!166705 (bitIndex!0 (size!2275 (buf!2669 thiss!1305)) (currentByte!5211 thiss!1305) (currentBit!5206 thiss!1305)))))

(declare-fun b!109924 () Bool)

(assert (=> b!109924 (= e!72031 (= (_2!4832 lt!166722) (_2!4832 lt!166726)))))

(assert (= (and start!21742 res!90716) b!109919))

(assert (= (and b!109919 res!90711) b!109913))

(assert (= (and b!109913 res!90722) b!109912))

(assert (= (and b!109912 res!90721) b!109923))

(assert (= (and b!109923 res!90720) b!109911))

(assert (= (and b!109911 res!90714) b!109921))

(assert (= (and b!109921 res!90723) b!109920))

(assert (= (and b!109912 res!90715) b!109917))

(assert (= (and b!109917 res!90719) b!109916))

(assert (= (and b!109912 res!90713) b!109924))

(assert (= (and b!109912 (not res!90724)) b!109915))

(assert (= (and b!109915 res!90712) b!109918))

(assert (= (and b!109915 (not res!90717)) b!109922))

(assert (= (and b!109922 (not res!90718)) b!109914))

(assert (= start!21742 b!109910))

(declare-fun m!163403 () Bool)

(assert (=> b!109921 m!163403))

(assert (=> b!109921 m!163403))

(declare-fun m!163405 () Bool)

(assert (=> b!109921 m!163405))

(declare-fun m!163407 () Bool)

(assert (=> b!109913 m!163407))

(declare-fun m!163409 () Bool)

(assert (=> b!109916 m!163409))

(declare-fun m!163411 () Bool)

(assert (=> b!109919 m!163411))

(declare-fun m!163413 () Bool)

(assert (=> b!109915 m!163413))

(declare-fun m!163415 () Bool)

(assert (=> b!109915 m!163415))

(declare-fun m!163417 () Bool)

(assert (=> b!109915 m!163417))

(declare-fun m!163419 () Bool)

(assert (=> b!109915 m!163419))

(declare-fun m!163421 () Bool)

(assert (=> b!109915 m!163421))

(declare-fun m!163423 () Bool)

(assert (=> b!109915 m!163423))

(declare-fun m!163425 () Bool)

(assert (=> b!109915 m!163425))

(declare-fun m!163427 () Bool)

(assert (=> b!109915 m!163427))

(declare-fun m!163429 () Bool)

(assert (=> b!109922 m!163429))

(assert (=> b!109923 m!163423))

(assert (=> b!109923 m!163419))

(declare-fun m!163431 () Bool)

(assert (=> b!109912 m!163431))

(declare-fun m!163433 () Bool)

(assert (=> b!109912 m!163433))

(declare-fun m!163435 () Bool)

(assert (=> b!109912 m!163435))

(declare-fun m!163437 () Bool)

(assert (=> b!109912 m!163437))

(declare-fun m!163439 () Bool)

(assert (=> b!109912 m!163439))

(declare-fun m!163441 () Bool)

(assert (=> b!109912 m!163441))

(declare-fun m!163443 () Bool)

(assert (=> b!109912 m!163443))

(declare-fun m!163445 () Bool)

(assert (=> b!109912 m!163445))

(declare-fun m!163447 () Bool)

(assert (=> b!109912 m!163447))

(declare-fun m!163449 () Bool)

(assert (=> b!109912 m!163449))

(declare-fun m!163451 () Bool)

(assert (=> b!109912 m!163451))

(declare-fun m!163453 () Bool)

(assert (=> b!109912 m!163453))

(declare-fun m!163455 () Bool)

(assert (=> b!109912 m!163455))

(declare-fun m!163457 () Bool)

(assert (=> b!109912 m!163457))

(declare-fun m!163459 () Bool)

(assert (=> b!109912 m!163459))

(declare-fun m!163461 () Bool)

(assert (=> b!109912 m!163461))

(declare-fun m!163463 () Bool)

(assert (=> b!109912 m!163463))

(declare-fun m!163465 () Bool)

(assert (=> b!109912 m!163465))

(declare-fun m!163467 () Bool)

(assert (=> b!109912 m!163467))

(declare-fun m!163469 () Bool)

(assert (=> b!109920 m!163469))

(declare-fun m!163471 () Bool)

(assert (=> b!109910 m!163471))

(declare-fun m!163473 () Bool)

(assert (=> start!21742 m!163473))

(declare-fun m!163475 () Bool)

(assert (=> b!109911 m!163475))

(declare-fun m!163477 () Bool)

(assert (=> b!109917 m!163477))

(push 1)

(assert (not b!109923))

(assert (not b!109910))

(assert (not b!109916))

(assert (not b!109920))

(assert (not start!21742))

(assert (not b!109911))

(assert (not b!109922))

(assert (not b!109915))

(assert (not b!109912))

(assert (not b!109917))

(assert (not b!109921))

(assert (not b!109919))

(assert (not b!109913))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


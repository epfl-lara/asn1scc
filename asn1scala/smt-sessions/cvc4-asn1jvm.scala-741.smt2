; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20782 () Bool)

(assert start!20782)

(declare-fun b!105218 () Bool)

(declare-fun e!68934 () Bool)

(declare-fun e!68933 () Bool)

(assert (=> b!105218 (= e!68934 e!68933)))

(declare-fun res!86648 () Bool)

(assert (=> b!105218 (=> (not res!86648) (not e!68933))))

(declare-datatypes ((array!4879 0))(
  ( (array!4880 (arr!2819 (Array (_ BitVec 32) (_ BitVec 8))) (size!2226 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3926 0))(
  ( (BitStream!3927 (buf!2597 array!4879) (currentByte!5090 (_ BitVec 32)) (currentBit!5085 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3926)

(declare-fun lt!154855 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!105218 (= res!86648 (validate_offset_bits!1 ((_ sign_extend 32) (size!2226 (buf!2597 thiss!1305))) ((_ sign_extend 32) (currentByte!5090 thiss!1305)) ((_ sign_extend 32) (currentBit!5085 thiss!1305)) lt!154855))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!105218 (= lt!154855 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!105219 () Bool)

(declare-fun res!86649 () Bool)

(assert (=> b!105219 (=> (not res!86649) (not e!68933))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!105219 (= res!86649 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!105220 () Bool)

(declare-fun e!68932 () Bool)

(declare-datatypes ((tuple2!8666 0))(
  ( (tuple2!8667 (_1!4590 BitStream!3926) (_2!4590 Bool)) )
))
(declare-fun lt!154851 () tuple2!8666)

(declare-fun lt!154865 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!105220 (= e!68932 (= (bitIndex!0 (size!2226 (buf!2597 (_1!4590 lt!154851))) (currentByte!5090 (_1!4590 lt!154851)) (currentBit!5085 (_1!4590 lt!154851))) lt!154865))))

(declare-fun res!86646 () Bool)

(assert (=> start!20782 (=> (not res!86646) (not e!68934))))

(assert (=> start!20782 (= res!86646 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20782 e!68934))

(assert (=> start!20782 true))

(declare-fun e!68929 () Bool)

(declare-fun inv!12 (BitStream!3926) Bool)

(assert (=> start!20782 (and (inv!12 thiss!1305) e!68929)))

(declare-fun b!105221 () Bool)

(declare-fun array_inv!2028 (array!4879) Bool)

(assert (=> b!105221 (= e!68929 (array_inv!2028 (buf!2597 thiss!1305)))))

(declare-datatypes ((tuple2!8668 0))(
  ( (tuple2!8669 (_1!4591 BitStream!3926) (_2!4591 BitStream!3926)) )
))
(declare-fun lt!154860 () tuple2!8668)

(declare-datatypes ((Unit!6450 0))(
  ( (Unit!6451) )
))
(declare-datatypes ((tuple2!8670 0))(
  ( (tuple2!8671 (_1!4592 Unit!6450) (_2!4592 BitStream!3926)) )
))
(declare-fun lt!154854 () tuple2!8670)

(declare-fun b!105222 () Bool)

(declare-fun e!68930 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!3926 (_ BitVec 64)) Bool)

(assert (=> b!105222 (= e!68930 (moveBitIndexPrecond!0 (_2!4591 lt!154860) (bvsub (bitIndex!0 (size!2226 (buf!2597 thiss!1305)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)) (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154854))) (currentByte!5090 (_2!4592 lt!154854)) (currentBit!5085 (_2!4592 lt!154854))))))))

(declare-datatypes ((tuple2!8672 0))(
  ( (tuple2!8673 (_1!4593 BitStream!3926) (_2!4593 (_ BitVec 64))) )
))
(declare-fun lt!154853 () tuple2!8672)

(declare-fun lt!154862 () tuple2!8672)

(assert (=> b!105222 (and (= (_2!4593 lt!154853) (_2!4593 lt!154862)) (= (_1!4593 lt!154853) (_1!4593 lt!154862)))))

(declare-fun lt!154857 () Unit!6450)

(declare-fun lt!154847 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6450)

(assert (=> b!105222 (= lt!154857 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4591 lt!154860) nBits!396 i!615 lt!154847))))

(declare-fun lt!154846 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8672)

(declare-fun withMovedBitIndex!0 (BitStream!3926 (_ BitVec 64)) BitStream!3926)

(assert (=> b!105222 (= lt!154862 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4591 lt!154860) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154846))))

(declare-fun b!105223 () Bool)

(declare-fun e!68928 () Bool)

(assert (=> b!105223 (= e!68928 e!68932)))

(declare-fun res!86653 () Bool)

(assert (=> b!105223 (=> (not res!86653) (not e!68932))))

(declare-fun lt!154845 () Bool)

(declare-fun lt!154864 () tuple2!8670)

(assert (=> b!105223 (= res!86653 (and (= (_2!4590 lt!154851) lt!154845) (= (_1!4590 lt!154851) (_2!4592 lt!154864))))))

(declare-fun readBitPure!0 (BitStream!3926) tuple2!8666)

(declare-fun readerFrom!0 (BitStream!3926 (_ BitVec 32) (_ BitVec 32)) BitStream!3926)

(assert (=> b!105223 (= lt!154851 (readBitPure!0 (readerFrom!0 (_2!4592 lt!154864) (currentBit!5085 thiss!1305) (currentByte!5090 thiss!1305))))))

(declare-fun b!105224 () Bool)

(declare-fun e!68926 () Bool)

(assert (=> b!105224 (= e!68926 e!68928)))

(declare-fun res!86655 () Bool)

(assert (=> b!105224 (=> (not res!86655) (not e!68928))))

(declare-fun lt!154850 () (_ BitVec 64))

(assert (=> b!105224 (= res!86655 (= lt!154865 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!154850)))))

(assert (=> b!105224 (= lt!154865 (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154864))) (currentByte!5090 (_2!4592 lt!154864)) (currentBit!5085 (_2!4592 lt!154864))))))

(assert (=> b!105224 (= lt!154850 (bitIndex!0 (size!2226 (buf!2597 thiss!1305)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)))))

(declare-fun b!105225 () Bool)

(declare-fun e!68935 () Bool)

(declare-fun lt!154866 () tuple2!8666)

(declare-fun lt!154859 () tuple2!8666)

(assert (=> b!105225 (= e!68935 (= (_2!4590 lt!154866) (_2!4590 lt!154859)))))

(declare-fun b!105226 () Bool)

(declare-fun res!86652 () Bool)

(assert (=> b!105226 (=> (not res!86652) (not e!68933))))

(assert (=> b!105226 (= res!86652 (bvslt i!615 nBits!396))))

(declare-fun b!105227 () Bool)

(assert (=> b!105227 (= e!68933 (not e!68930))))

(declare-fun res!86644 () Bool)

(assert (=> b!105227 (=> res!86644 e!68930)))

(declare-fun lt!154849 () tuple2!8668)

(assert (=> b!105227 (= res!86644 (not (= (_1!4593 (readNLeastSignificantBitsLoopPure!0 (_1!4591 lt!154849) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154846)) (_2!4591 lt!154849))))))

(declare-fun lt!154844 () (_ BitVec 64))

(assert (=> b!105227 (validate_offset_bits!1 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154854)))) ((_ sign_extend 32) (currentByte!5090 (_2!4592 lt!154864))) ((_ sign_extend 32) (currentBit!5085 (_2!4592 lt!154864))) lt!154844)))

(declare-fun lt!154843 () Unit!6450)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3926 array!4879 (_ BitVec 64)) Unit!6450)

(assert (=> b!105227 (= lt!154843 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4592 lt!154864) (buf!2597 (_2!4592 lt!154854)) lt!154844))))

(assert (=> b!105227 (= lt!154844 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!154863 () tuple2!8666)

(declare-fun lt!154856 () (_ BitVec 64))

(assert (=> b!105227 (= lt!154846 (bvor lt!154847 (ite (_2!4590 lt!154863) lt!154856 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105227 (= lt!154853 (readNLeastSignificantBitsLoopPure!0 (_1!4591 lt!154860) nBits!396 i!615 lt!154847))))

(assert (=> b!105227 (validate_offset_bits!1 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154854)))) ((_ sign_extend 32) (currentByte!5090 thiss!1305)) ((_ sign_extend 32) (currentBit!5085 thiss!1305)) lt!154855)))

(declare-fun lt!154852 () Unit!6450)

(assert (=> b!105227 (= lt!154852 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2597 (_2!4592 lt!154854)) lt!154855))))

(assert (=> b!105227 (= lt!154847 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!105227 (= (_2!4590 lt!154863) lt!154845)))

(assert (=> b!105227 (= lt!154863 (readBitPure!0 (_1!4591 lt!154860)))))

(declare-fun reader!0 (BitStream!3926 BitStream!3926) tuple2!8668)

(assert (=> b!105227 (= lt!154849 (reader!0 (_2!4592 lt!154864) (_2!4592 lt!154854)))))

(assert (=> b!105227 (= lt!154860 (reader!0 thiss!1305 (_2!4592 lt!154854)))))

(assert (=> b!105227 e!68935))

(declare-fun res!86645 () Bool)

(assert (=> b!105227 (=> (not res!86645) (not e!68935))))

(assert (=> b!105227 (= res!86645 (= (bitIndex!0 (size!2226 (buf!2597 (_1!4590 lt!154866))) (currentByte!5090 (_1!4590 lt!154866)) (currentBit!5085 (_1!4590 lt!154866))) (bitIndex!0 (size!2226 (buf!2597 (_1!4590 lt!154859))) (currentByte!5090 (_1!4590 lt!154859)) (currentBit!5085 (_1!4590 lt!154859)))))))

(declare-fun lt!154858 () Unit!6450)

(declare-fun lt!154848 () BitStream!3926)

(declare-fun readBitPrefixLemma!0 (BitStream!3926 BitStream!3926) Unit!6450)

(assert (=> b!105227 (= lt!154858 (readBitPrefixLemma!0 lt!154848 (_2!4592 lt!154854)))))

(assert (=> b!105227 (= lt!154859 (readBitPure!0 (BitStream!3927 (buf!2597 (_2!4592 lt!154854)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305))))))

(assert (=> b!105227 (= lt!154866 (readBitPure!0 lt!154848))))

(assert (=> b!105227 (= lt!154848 (BitStream!3927 (buf!2597 (_2!4592 lt!154864)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)))))

(declare-fun e!68931 () Bool)

(assert (=> b!105227 e!68931))

(declare-fun res!86647 () Bool)

(assert (=> b!105227 (=> (not res!86647) (not e!68931))))

(declare-fun isPrefixOf!0 (BitStream!3926 BitStream!3926) Bool)

(assert (=> b!105227 (= res!86647 (isPrefixOf!0 thiss!1305 (_2!4592 lt!154854)))))

(declare-fun lt!154861 () Unit!6450)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3926 BitStream!3926 BitStream!3926) Unit!6450)

(assert (=> b!105227 (= lt!154861 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4592 lt!154864) (_2!4592 lt!154854)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3926 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8670)

(assert (=> b!105227 (= lt!154854 (appendNLeastSignificantBitsLoop!0 (_2!4592 lt!154864) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!105227 e!68926))

(declare-fun res!86650 () Bool)

(assert (=> b!105227 (=> (not res!86650) (not e!68926))))

(assert (=> b!105227 (= res!86650 (= (size!2226 (buf!2597 thiss!1305)) (size!2226 (buf!2597 (_2!4592 lt!154864)))))))

(declare-fun appendBit!0 (BitStream!3926 Bool) tuple2!8670)

(assert (=> b!105227 (= lt!154864 (appendBit!0 thiss!1305 lt!154845))))

(assert (=> b!105227 (= lt!154845 (not (= (bvand v!199 lt!154856) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105227 (= lt!154856 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!105228 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!105228 (= e!68931 (invariant!0 (currentBit!5085 thiss!1305) (currentByte!5090 thiss!1305) (size!2226 (buf!2597 (_2!4592 lt!154854)))))))

(declare-fun b!105229 () Bool)

(declare-fun res!86651 () Bool)

(assert (=> b!105229 (=> (not res!86651) (not e!68931))))

(assert (=> b!105229 (= res!86651 (invariant!0 (currentBit!5085 thiss!1305) (currentByte!5090 thiss!1305) (size!2226 (buf!2597 (_2!4592 lt!154864)))))))

(declare-fun b!105230 () Bool)

(declare-fun res!86654 () Bool)

(assert (=> b!105230 (=> (not res!86654) (not e!68928))))

(assert (=> b!105230 (= res!86654 (isPrefixOf!0 thiss!1305 (_2!4592 lt!154864)))))

(assert (= (and start!20782 res!86646) b!105218))

(assert (= (and b!105218 res!86648) b!105219))

(assert (= (and b!105219 res!86649) b!105226))

(assert (= (and b!105226 res!86652) b!105227))

(assert (= (and b!105227 res!86650) b!105224))

(assert (= (and b!105224 res!86655) b!105230))

(assert (= (and b!105230 res!86654) b!105223))

(assert (= (and b!105223 res!86653) b!105220))

(assert (= (and b!105227 res!86647) b!105229))

(assert (= (and b!105229 res!86651) b!105228))

(assert (= (and b!105227 res!86645) b!105225))

(assert (= (and b!105227 (not res!86644)) b!105222))

(assert (= start!20782 b!105221))

(declare-fun m!154471 () Bool)

(assert (=> b!105222 m!154471))

(declare-fun m!154473 () Bool)

(assert (=> b!105222 m!154473))

(declare-fun m!154475 () Bool)

(assert (=> b!105222 m!154475))

(declare-fun m!154477 () Bool)

(assert (=> b!105222 m!154477))

(assert (=> b!105222 m!154475))

(declare-fun m!154479 () Bool)

(assert (=> b!105222 m!154479))

(declare-fun m!154481 () Bool)

(assert (=> b!105222 m!154481))

(declare-fun m!154483 () Bool)

(assert (=> b!105220 m!154483))

(declare-fun m!154485 () Bool)

(assert (=> b!105218 m!154485))

(declare-fun m!154487 () Bool)

(assert (=> b!105229 m!154487))

(declare-fun m!154489 () Bool)

(assert (=> b!105219 m!154489))

(declare-fun m!154491 () Bool)

(assert (=> b!105223 m!154491))

(assert (=> b!105223 m!154491))

(declare-fun m!154493 () Bool)

(assert (=> b!105223 m!154493))

(declare-fun m!154495 () Bool)

(assert (=> b!105221 m!154495))

(declare-fun m!154497 () Bool)

(assert (=> b!105227 m!154497))

(declare-fun m!154499 () Bool)

(assert (=> b!105227 m!154499))

(declare-fun m!154501 () Bool)

(assert (=> b!105227 m!154501))

(declare-fun m!154503 () Bool)

(assert (=> b!105227 m!154503))

(declare-fun m!154505 () Bool)

(assert (=> b!105227 m!154505))

(declare-fun m!154507 () Bool)

(assert (=> b!105227 m!154507))

(declare-fun m!154509 () Bool)

(assert (=> b!105227 m!154509))

(declare-fun m!154511 () Bool)

(assert (=> b!105227 m!154511))

(declare-fun m!154513 () Bool)

(assert (=> b!105227 m!154513))

(declare-fun m!154515 () Bool)

(assert (=> b!105227 m!154515))

(declare-fun m!154517 () Bool)

(assert (=> b!105227 m!154517))

(declare-fun m!154519 () Bool)

(assert (=> b!105227 m!154519))

(declare-fun m!154521 () Bool)

(assert (=> b!105227 m!154521))

(declare-fun m!154523 () Bool)

(assert (=> b!105227 m!154523))

(declare-fun m!154525 () Bool)

(assert (=> b!105227 m!154525))

(declare-fun m!154527 () Bool)

(assert (=> b!105227 m!154527))

(declare-fun m!154529 () Bool)

(assert (=> b!105227 m!154529))

(declare-fun m!154531 () Bool)

(assert (=> b!105227 m!154531))

(declare-fun m!154533 () Bool)

(assert (=> b!105227 m!154533))

(declare-fun m!154535 () Bool)

(assert (=> b!105224 m!154535))

(assert (=> b!105224 m!154479))

(declare-fun m!154537 () Bool)

(assert (=> b!105230 m!154537))

(declare-fun m!154539 () Bool)

(assert (=> start!20782 m!154539))

(declare-fun m!154541 () Bool)

(assert (=> b!105228 m!154541))

(push 1)

(assert (not b!105218))

(assert (not b!105230))

(assert (not b!105220))

(assert (not b!105228))

(assert (not b!105229))

(assert (not b!105222))

(assert (not b!105221))

(assert (not b!105224))

(assert (not b!105227))

(assert (not b!105219))

(assert (not b!105223))

(assert (not start!20782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!32934 () Bool)

(assert (=> d!32934 (= (invariant!0 (currentBit!5085 thiss!1305) (currentByte!5090 thiss!1305) (size!2226 (buf!2597 (_2!4592 lt!154864)))) (and (bvsge (currentBit!5085 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5085 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5090 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5090 thiss!1305) (size!2226 (buf!2597 (_2!4592 lt!154864)))) (and (= (currentBit!5085 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5090 thiss!1305) (size!2226 (buf!2597 (_2!4592 lt!154864))))))))))

(assert (=> b!105229 d!32934))

(declare-fun d!32940 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!32940 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2226 (buf!2597 thiss!1305))) ((_ sign_extend 32) (currentByte!5090 thiss!1305)) ((_ sign_extend 32) (currentBit!5085 thiss!1305)) lt!154855) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2226 (buf!2597 thiss!1305))) ((_ sign_extend 32) (currentByte!5090 thiss!1305)) ((_ sign_extend 32) (currentBit!5085 thiss!1305))) lt!154855))))

(declare-fun bs!8048 () Bool)

(assert (= bs!8048 d!32940))

(declare-fun m!154557 () Bool)

(assert (=> bs!8048 m!154557))

(assert (=> b!105218 d!32940))

(declare-fun d!32942 () Bool)

(assert (=> d!32942 (= (invariant!0 (currentBit!5085 thiss!1305) (currentByte!5090 thiss!1305) (size!2226 (buf!2597 (_2!4592 lt!154854)))) (and (bvsge (currentBit!5085 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5085 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5090 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5090 thiss!1305) (size!2226 (buf!2597 (_2!4592 lt!154854)))) (and (= (currentBit!5085 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5090 thiss!1305) (size!2226 (buf!2597 (_2!4592 lt!154854))))))))))

(assert (=> b!105228 d!32942))

(declare-fun d!32944 () Bool)

(assert (=> d!32944 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!105227 d!32944))

(declare-fun d!32946 () Bool)

(declare-datatypes ((tuple2!8676 0))(
  ( (tuple2!8677 (_1!4595 (_ BitVec 64)) (_2!4595 BitStream!3926)) )
))
(declare-fun lt!154902 () tuple2!8676)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8676)

(assert (=> d!32946 (= lt!154902 (readNLeastSignificantBitsLoop!0 (_1!4591 lt!154849) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154846))))

(assert (=> d!32946 (= (readNLeastSignificantBitsLoopPure!0 (_1!4591 lt!154849) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154846) (tuple2!8673 (_2!4595 lt!154902) (_1!4595 lt!154902)))))

(declare-fun bs!8049 () Bool)

(assert (= bs!8049 d!32946))

(declare-fun m!154561 () Bool)

(assert (=> bs!8049 m!154561))

(assert (=> b!105227 d!32946))

(declare-fun b!105309 () Bool)

(declare-fun res!86720 () Bool)

(declare-fun e!68980 () Bool)

(assert (=> b!105309 (=> (not res!86720) (not e!68980))))

(declare-fun lt!155138 () tuple2!8670)

(declare-fun lt!155112 () (_ BitVec 64))

(declare-fun lt!155116 () (_ BitVec 64))

(assert (=> b!105309 (= res!86720 (= (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!155138))) (currentByte!5090 (_2!4592 lt!155138)) (currentBit!5085 (_2!4592 lt!155138))) (bvadd lt!155112 lt!155116)))))

(assert (=> b!105309 (or (not (= (bvand lt!155112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155116 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!155112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!155112 lt!155116) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105309 (= lt!155116 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!105309 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105309 (= lt!155112 (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154864))) (currentByte!5090 (_2!4592 lt!154864)) (currentBit!5085 (_2!4592 lt!154864))))))

(declare-fun b!105310 () Bool)

(declare-fun e!68985 () tuple2!8670)

(declare-fun lt!155150 () Unit!6450)

(assert (=> b!105310 (= e!68985 (tuple2!8671 lt!155150 (_2!4592 lt!154864)))))

(declare-fun lt!155125 () BitStream!3926)

(assert (=> b!105310 (= lt!155125 (_2!4592 lt!154864))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3926) Unit!6450)

(assert (=> b!105310 (= lt!155150 (lemmaIsPrefixRefl!0 lt!155125))))

(declare-fun call!1317 () Bool)

(assert (=> b!105310 call!1317))

(declare-fun c!6493 () Bool)

(declare-fun lt!155131 () tuple2!8670)

(declare-fun bm!1314 () Bool)

(assert (=> bm!1314 (= call!1317 (isPrefixOf!0 (ite c!6493 (_2!4592 lt!154864) lt!155125) (ite c!6493 (_2!4592 lt!155131) lt!155125)))))

(declare-fun b!105312 () Bool)

(declare-fun e!68979 () (_ BitVec 64))

(assert (=> b!105312 (= e!68979 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!105313 () Bool)

(declare-fun res!86719 () Bool)

(declare-fun lt!155145 () tuple2!8670)

(assert (=> b!105313 (= res!86719 (isPrefixOf!0 (_2!4592 lt!154864) (_2!4592 lt!155145)))))

(declare-fun e!68983 () Bool)

(assert (=> b!105313 (=> (not res!86719) (not e!68983))))

(declare-fun b!105314 () Bool)

(assert (=> b!105314 (= e!68979 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!105315 () Bool)

(declare-fun lt!155146 () tuple2!8666)

(assert (=> b!105315 (= lt!155146 (readBitPure!0 (readerFrom!0 (_2!4592 lt!155145) (currentBit!5085 (_2!4592 lt!154864)) (currentByte!5090 (_2!4592 lt!154864)))))))

(declare-fun res!86723 () Bool)

(declare-fun lt!155123 () Bool)

(assert (=> b!105315 (= res!86723 (and (= (_2!4590 lt!155146) lt!155123) (= (_1!4590 lt!155146) (_2!4592 lt!155145))))))

(declare-fun e!68981 () Bool)

(assert (=> b!105315 (=> (not res!86723) (not e!68981))))

(assert (=> b!105315 (= e!68983 e!68981)))

(declare-fun b!105316 () Bool)

(declare-fun Unit!6452 () Unit!6450)

(assert (=> b!105316 (= e!68985 (tuple2!8671 Unit!6452 (_2!4592 lt!155131)))))

(assert (=> b!105316 (= lt!155123 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105316 (= lt!155145 (appendBit!0 (_2!4592 lt!154864) lt!155123))))

(declare-fun res!86725 () Bool)

(assert (=> b!105316 (= res!86725 (= (size!2226 (buf!2597 (_2!4592 lt!154864))) (size!2226 (buf!2597 (_2!4592 lt!155145)))))))

(assert (=> b!105316 (=> (not res!86725) (not e!68983))))

(assert (=> b!105316 e!68983))

(declare-fun lt!155110 () tuple2!8670)

(assert (=> b!105316 (= lt!155110 lt!155145)))

(assert (=> b!105316 (= lt!155131 (appendNLeastSignificantBitsLoop!0 (_2!4592 lt!155110) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!155140 () Unit!6450)

(assert (=> b!105316 (= lt!155140 (lemmaIsPrefixTransitive!0 (_2!4592 lt!154864) (_2!4592 lt!155110) (_2!4592 lt!155131)))))

(assert (=> b!105316 call!1317))

(declare-fun lt!155136 () Unit!6450)

(assert (=> b!105316 (= lt!155136 lt!155140)))

(assert (=> b!105316 (invariant!0 (currentBit!5085 (_2!4592 lt!154864)) (currentByte!5090 (_2!4592 lt!154864)) (size!2226 (buf!2597 (_2!4592 lt!155110))))))

(declare-fun lt!155122 () BitStream!3926)

(assert (=> b!105316 (= lt!155122 (BitStream!3927 (buf!2597 (_2!4592 lt!155110)) (currentByte!5090 (_2!4592 lt!154864)) (currentBit!5085 (_2!4592 lt!154864))))))

(assert (=> b!105316 (invariant!0 (currentBit!5085 lt!155122) (currentByte!5090 lt!155122) (size!2226 (buf!2597 (_2!4592 lt!155131))))))

(declare-fun lt!155127 () BitStream!3926)

(assert (=> b!105316 (= lt!155127 (BitStream!3927 (buf!2597 (_2!4592 lt!155131)) (currentByte!5090 lt!155122) (currentBit!5085 lt!155122)))))

(declare-fun lt!155111 () tuple2!8666)

(assert (=> b!105316 (= lt!155111 (readBitPure!0 lt!155122))))

(declare-fun lt!155120 () tuple2!8666)

(assert (=> b!105316 (= lt!155120 (readBitPure!0 lt!155127))))

(declare-fun lt!155144 () Unit!6450)

(assert (=> b!105316 (= lt!155144 (readBitPrefixLemma!0 lt!155122 (_2!4592 lt!155131)))))

(declare-fun res!86727 () Bool)

(assert (=> b!105316 (= res!86727 (= (bitIndex!0 (size!2226 (buf!2597 (_1!4590 lt!155111))) (currentByte!5090 (_1!4590 lt!155111)) (currentBit!5085 (_1!4590 lt!155111))) (bitIndex!0 (size!2226 (buf!2597 (_1!4590 lt!155120))) (currentByte!5090 (_1!4590 lt!155120)) (currentBit!5085 (_1!4590 lt!155120)))))))

(declare-fun e!68984 () Bool)

(assert (=> b!105316 (=> (not res!86727) (not e!68984))))

(assert (=> b!105316 e!68984))

(declare-fun lt!155153 () Unit!6450)

(assert (=> b!105316 (= lt!155153 lt!155144)))

(declare-fun lt!155113 () tuple2!8668)

(assert (=> b!105316 (= lt!155113 (reader!0 (_2!4592 lt!154864) (_2!4592 lt!155131)))))

(declare-fun lt!155142 () tuple2!8668)

(assert (=> b!105316 (= lt!155142 (reader!0 (_2!4592 lt!155110) (_2!4592 lt!155131)))))

(declare-fun lt!155135 () tuple2!8666)

(assert (=> b!105316 (= lt!155135 (readBitPure!0 (_1!4591 lt!155113)))))

(assert (=> b!105316 (= (_2!4590 lt!155135) lt!155123)))

(declare-fun lt!155117 () Unit!6450)

(declare-fun Unit!6454 () Unit!6450)

(assert (=> b!105316 (= lt!155117 Unit!6454)))

(declare-fun lt!155118 () (_ BitVec 64))

(assert (=> b!105316 (= lt!155118 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!155124 () (_ BitVec 64))

(assert (=> b!105316 (= lt!155124 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!155152 () Unit!6450)

(assert (=> b!105316 (= lt!155152 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4592 lt!154864) (buf!2597 (_2!4592 lt!155131)) lt!155124))))

(assert (=> b!105316 (validate_offset_bits!1 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!155131)))) ((_ sign_extend 32) (currentByte!5090 (_2!4592 lt!154864))) ((_ sign_extend 32) (currentBit!5085 (_2!4592 lt!154864))) lt!155124)))

(declare-fun lt!155115 () Unit!6450)

(assert (=> b!105316 (= lt!155115 lt!155152)))

(declare-fun lt!155126 () tuple2!8672)

(assert (=> b!105316 (= lt!155126 (readNLeastSignificantBitsLoopPure!0 (_1!4591 lt!155113) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155118))))

(declare-fun lt!155119 () (_ BitVec 64))

(assert (=> b!105316 (= lt!155119 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!155114 () Unit!6450)

(assert (=> b!105316 (= lt!155114 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4592 lt!155110) (buf!2597 (_2!4592 lt!155131)) lt!155119))))

(assert (=> b!105316 (validate_offset_bits!1 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!155131)))) ((_ sign_extend 32) (currentByte!5090 (_2!4592 lt!155110))) ((_ sign_extend 32) (currentBit!5085 (_2!4592 lt!155110))) lt!155119)))

(declare-fun lt!155154 () Unit!6450)

(assert (=> b!105316 (= lt!155154 lt!155114)))

(declare-fun lt!155132 () tuple2!8672)

(assert (=> b!105316 (= lt!155132 (readNLeastSignificantBitsLoopPure!0 (_1!4591 lt!155142) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!155118 (ite (_2!4590 lt!155135) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!155121 () tuple2!8672)

(assert (=> b!105316 (= lt!155121 (readNLeastSignificantBitsLoopPure!0 (_1!4591 lt!155113) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155118))))

(declare-fun c!6494 () Bool)

(assert (=> b!105316 (= c!6494 (_2!4590 (readBitPure!0 (_1!4591 lt!155113))))))

(declare-fun lt!155137 () tuple2!8672)

(assert (=> b!105316 (= lt!155137 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4591 lt!155113) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!155118 e!68979)))))

(declare-fun lt!155139 () Unit!6450)

(assert (=> b!105316 (= lt!155139 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4591 lt!155113) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155118))))

(assert (=> b!105316 (and (= (_2!4593 lt!155121) (_2!4593 lt!155137)) (= (_1!4593 lt!155121) (_1!4593 lt!155137)))))

(declare-fun lt!155147 () Unit!6450)

(assert (=> b!105316 (= lt!155147 lt!155139)))

(assert (=> b!105316 (= (_1!4591 lt!155113) (withMovedBitIndex!0 (_2!4591 lt!155113) (bvsub (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154864))) (currentByte!5090 (_2!4592 lt!154864)) (currentBit!5085 (_2!4592 lt!154864))) (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!155131))) (currentByte!5090 (_2!4592 lt!155131)) (currentBit!5085 (_2!4592 lt!155131))))))))

(declare-fun lt!155129 () Unit!6450)

(declare-fun Unit!6456 () Unit!6450)

(assert (=> b!105316 (= lt!155129 Unit!6456)))

(assert (=> b!105316 (= (_1!4591 lt!155142) (withMovedBitIndex!0 (_2!4591 lt!155142) (bvsub (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!155110))) (currentByte!5090 (_2!4592 lt!155110)) (currentBit!5085 (_2!4592 lt!155110))) (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!155131))) (currentByte!5090 (_2!4592 lt!155131)) (currentBit!5085 (_2!4592 lt!155131))))))))

(declare-fun lt!155143 () Unit!6450)

(declare-fun Unit!6457 () Unit!6450)

(assert (=> b!105316 (= lt!155143 Unit!6457)))

(assert (=> b!105316 (= (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154864))) (currentByte!5090 (_2!4592 lt!154864)) (currentBit!5085 (_2!4592 lt!154864))) (bvsub (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!155110))) (currentByte!5090 (_2!4592 lt!155110)) (currentBit!5085 (_2!4592 lt!155110))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!155128 () Unit!6450)

(declare-fun Unit!6458 () Unit!6450)

(assert (=> b!105316 (= lt!155128 Unit!6458)))

(assert (=> b!105316 (= (_2!4593 lt!155126) (_2!4593 lt!155132))))

(declare-fun lt!155134 () Unit!6450)

(declare-fun Unit!6459 () Unit!6450)

(assert (=> b!105316 (= lt!155134 Unit!6459)))

(assert (=> b!105316 (= (_1!4593 lt!155126) (_2!4591 lt!155113))))

(declare-fun b!105317 () Bool)

(declare-fun res!86726 () Bool)

(assert (=> b!105317 (=> (not res!86726) (not e!68980))))

(assert (=> b!105317 (= res!86726 (isPrefixOf!0 (_2!4592 lt!154864) (_2!4592 lt!155138)))))

(declare-fun b!105318 () Bool)

(declare-fun res!86721 () Bool)

(assert (=> b!105318 (= res!86721 (= (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!155145))) (currentByte!5090 (_2!4592 lt!155145)) (currentBit!5085 (_2!4592 lt!155145))) (bvadd (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154864))) (currentByte!5090 (_2!4592 lt!154864)) (currentBit!5085 (_2!4592 lt!154864))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!105318 (=> (not res!86721) (not e!68983))))

(declare-fun b!105319 () Bool)

(declare-fun e!68982 () Bool)

(declare-fun lt!155133 () (_ BitVec 64))

(assert (=> b!105319 (= e!68982 (validate_offset_bits!1 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154864)))) ((_ sign_extend 32) (currentByte!5090 (_2!4592 lt!154864))) ((_ sign_extend 32) (currentBit!5085 (_2!4592 lt!154864))) lt!155133))))

(declare-fun d!32950 () Bool)

(assert (=> d!32950 e!68980))

(declare-fun res!86724 () Bool)

(assert (=> d!32950 (=> (not res!86724) (not e!68980))))

(assert (=> d!32950 (= res!86724 (= (size!2226 (buf!2597 (_2!4592 lt!154864))) (size!2226 (buf!2597 (_2!4592 lt!155138)))))))

(assert (=> d!32950 (= lt!155138 e!68985)))

(assert (=> d!32950 (= c!6493 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!32950 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32950 (= (appendNLeastSignificantBitsLoop!0 (_2!4592 lt!154864) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!155138)))

(declare-fun b!105311 () Bool)

(declare-fun lt!155148 () tuple2!8668)

(declare-fun lt!155151 () tuple2!8672)

(assert (=> b!105311 (= e!68980 (and (= (_2!4593 lt!155151) v!199) (= (_1!4593 lt!155151) (_2!4591 lt!155148))))))

(declare-fun lt!155141 () (_ BitVec 64))

(assert (=> b!105311 (= lt!155151 (readNLeastSignificantBitsLoopPure!0 (_1!4591 lt!155148) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155141))))

(declare-fun lt!155149 () Unit!6450)

(declare-fun lt!155130 () Unit!6450)

(assert (=> b!105311 (= lt!155149 lt!155130)))

(assert (=> b!105311 (validate_offset_bits!1 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!155138)))) ((_ sign_extend 32) (currentByte!5090 (_2!4592 lt!154864))) ((_ sign_extend 32) (currentBit!5085 (_2!4592 lt!154864))) lt!155133)))

(assert (=> b!105311 (= lt!155130 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4592 lt!154864) (buf!2597 (_2!4592 lt!155138)) lt!155133))))

(assert (=> b!105311 e!68982))

(declare-fun res!86722 () Bool)

(assert (=> b!105311 (=> (not res!86722) (not e!68982))))

(assert (=> b!105311 (= res!86722 (and (= (size!2226 (buf!2597 (_2!4592 lt!154864))) (size!2226 (buf!2597 (_2!4592 lt!155138)))) (bvsge lt!155133 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105311 (= lt!155133 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!105311 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105311 (= lt!155141 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!105311 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105311 (= lt!155148 (reader!0 (_2!4592 lt!154864) (_2!4592 lt!155138)))))

(declare-fun b!105320 () Bool)

(assert (=> b!105320 (= e!68981 (= (bitIndex!0 (size!2226 (buf!2597 (_1!4590 lt!155146))) (currentByte!5090 (_1!4590 lt!155146)) (currentBit!5085 (_1!4590 lt!155146))) (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!155145))) (currentByte!5090 (_2!4592 lt!155145)) (currentBit!5085 (_2!4592 lt!155145)))))))

(declare-fun b!105321 () Bool)

(assert (=> b!105321 (= e!68984 (= (_2!4590 lt!155111) (_2!4590 lt!155120)))))

(assert (= (and d!32950 c!6493) b!105316))

(assert (= (and d!32950 (not c!6493)) b!105310))

(assert (= (and b!105316 res!86725) b!105318))

(assert (= (and b!105318 res!86721) b!105313))

(assert (= (and b!105313 res!86719) b!105315))

(assert (= (and b!105315 res!86723) b!105320))

(assert (= (and b!105316 res!86727) b!105321))

(assert (= (and b!105316 c!6494) b!105314))

(assert (= (and b!105316 (not c!6494)) b!105312))

(assert (= (or b!105316 b!105310) bm!1314))

(assert (= (and d!32950 res!86724) b!105309))

(assert (= (and b!105309 res!86720) b!105317))

(assert (= (and b!105317 res!86726) b!105311))

(assert (= (and b!105311 res!86722) b!105319))

(declare-fun m!154657 () Bool)

(assert (=> b!105319 m!154657))

(declare-fun m!154659 () Bool)

(assert (=> b!105320 m!154659))

(declare-fun m!154661 () Bool)

(assert (=> b!105320 m!154661))

(declare-fun m!154663 () Bool)

(assert (=> b!105315 m!154663))

(assert (=> b!105315 m!154663))

(declare-fun m!154665 () Bool)

(assert (=> b!105315 m!154665))

(declare-fun m!154667 () Bool)

(assert (=> b!105313 m!154667))

(declare-fun m!154669 () Bool)

(assert (=> b!105310 m!154669))

(assert (=> b!105318 m!154661))

(assert (=> b!105318 m!154535))

(declare-fun m!154671 () Bool)

(assert (=> bm!1314 m!154671))

(declare-fun m!154673 () Bool)

(assert (=> b!105309 m!154673))

(assert (=> b!105309 m!154535))

(declare-fun m!154675 () Bool)

(assert (=> b!105311 m!154675))

(declare-fun m!154677 () Bool)

(assert (=> b!105311 m!154677))

(declare-fun m!154679 () Bool)

(assert (=> b!105311 m!154679))

(declare-fun m!154681 () Bool)

(assert (=> b!105311 m!154681))

(declare-fun m!154683 () Bool)

(assert (=> b!105311 m!154683))

(declare-fun m!154685 () Bool)

(assert (=> b!105317 m!154685))

(declare-fun m!154687 () Bool)

(assert (=> b!105316 m!154687))

(declare-fun m!154689 () Bool)

(assert (=> b!105316 m!154689))

(declare-fun m!154691 () Bool)

(assert (=> b!105316 m!154691))

(assert (=> b!105316 m!154535))

(declare-fun m!154693 () Bool)

(assert (=> b!105316 m!154693))

(declare-fun m!154695 () Bool)

(assert (=> b!105316 m!154695))

(declare-fun m!154697 () Bool)

(assert (=> b!105316 m!154697))

(declare-fun m!154699 () Bool)

(assert (=> b!105316 m!154699))

(declare-fun m!154701 () Bool)

(assert (=> b!105316 m!154701))

(declare-fun m!154703 () Bool)

(assert (=> b!105316 m!154703))

(declare-fun m!154705 () Bool)

(assert (=> b!105316 m!154705))

(assert (=> b!105316 m!154683))

(declare-fun m!154707 () Bool)

(assert (=> b!105316 m!154707))

(declare-fun m!154709 () Bool)

(assert (=> b!105316 m!154709))

(declare-fun m!154711 () Bool)

(assert (=> b!105316 m!154711))

(declare-fun m!154713 () Bool)

(assert (=> b!105316 m!154713))

(declare-fun m!154715 () Bool)

(assert (=> b!105316 m!154715))

(declare-fun m!154717 () Bool)

(assert (=> b!105316 m!154717))

(declare-fun m!154719 () Bool)

(assert (=> b!105316 m!154719))

(declare-fun m!154721 () Bool)

(assert (=> b!105316 m!154721))

(declare-fun m!154723 () Bool)

(assert (=> b!105316 m!154723))

(declare-fun m!154725 () Bool)

(assert (=> b!105316 m!154725))

(assert (=> b!105316 m!154691))

(declare-fun m!154727 () Bool)

(assert (=> b!105316 m!154727))

(declare-fun m!154729 () Bool)

(assert (=> b!105316 m!154729))

(declare-fun m!154731 () Bool)

(assert (=> b!105316 m!154731))

(declare-fun m!154733 () Bool)

(assert (=> b!105316 m!154733))

(declare-fun m!154735 () Bool)

(assert (=> b!105316 m!154735))

(declare-fun m!154737 () Bool)

(assert (=> b!105316 m!154737))

(assert (=> b!105227 d!32950))

(declare-fun d!32982 () Bool)

(assert (=> d!32982 (validate_offset_bits!1 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154854)))) ((_ sign_extend 32) (currentByte!5090 (_2!4592 lt!154864))) ((_ sign_extend 32) (currentBit!5085 (_2!4592 lt!154864))) lt!154844)))

(declare-fun lt!155157 () Unit!6450)

(declare-fun choose!9 (BitStream!3926 array!4879 (_ BitVec 64) BitStream!3926) Unit!6450)

(assert (=> d!32982 (= lt!155157 (choose!9 (_2!4592 lt!154864) (buf!2597 (_2!4592 lt!154854)) lt!154844 (BitStream!3927 (buf!2597 (_2!4592 lt!154854)) (currentByte!5090 (_2!4592 lt!154864)) (currentBit!5085 (_2!4592 lt!154864)))))))

(assert (=> d!32982 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4592 lt!154864) (buf!2597 (_2!4592 lt!154854)) lt!154844) lt!155157)))

(declare-fun bs!8058 () Bool)

(assert (= bs!8058 d!32982))

(assert (=> bs!8058 m!154505))

(declare-fun m!154739 () Bool)

(assert (=> bs!8058 m!154739))

(assert (=> b!105227 d!32982))

(declare-fun d!32984 () Bool)

(declare-datatypes ((tuple2!8680 0))(
  ( (tuple2!8681 (_1!4597 Bool) (_2!4597 BitStream!3926)) )
))
(declare-fun lt!155160 () tuple2!8680)

(declare-fun readBit!0 (BitStream!3926) tuple2!8680)

(assert (=> d!32984 (= lt!155160 (readBit!0 (BitStream!3927 (buf!2597 (_2!4592 lt!154854)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305))))))

(assert (=> d!32984 (= (readBitPure!0 (BitStream!3927 (buf!2597 (_2!4592 lt!154854)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305))) (tuple2!8667 (_2!4597 lt!155160) (_1!4597 lt!155160)))))

(declare-fun bs!8059 () Bool)

(assert (= bs!8059 d!32984))

(declare-fun m!154741 () Bool)

(assert (=> bs!8059 m!154741))

(assert (=> b!105227 d!32984))

(declare-fun d!32986 () Bool)

(assert (=> d!32986 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154854)))) ((_ sign_extend 32) (currentByte!5090 thiss!1305)) ((_ sign_extend 32) (currentBit!5085 thiss!1305)) lt!154855) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154854)))) ((_ sign_extend 32) (currentByte!5090 thiss!1305)) ((_ sign_extend 32) (currentBit!5085 thiss!1305))) lt!154855))))

(declare-fun bs!8060 () Bool)

(assert (= bs!8060 d!32986))

(declare-fun m!154743 () Bool)

(assert (=> bs!8060 m!154743))

(assert (=> b!105227 d!32986))

(declare-fun d!32988 () Bool)

(declare-fun lt!155161 () tuple2!8680)

(assert (=> d!32988 (= lt!155161 (readBit!0 (_1!4591 lt!154860)))))

(assert (=> d!32988 (= (readBitPure!0 (_1!4591 lt!154860)) (tuple2!8667 (_2!4597 lt!155161) (_1!4597 lt!155161)))))

(declare-fun bs!8061 () Bool)

(assert (= bs!8061 d!32988))

(declare-fun m!154745 () Bool)

(assert (=> bs!8061 m!154745))

(assert (=> b!105227 d!32988))

(declare-fun d!32990 () Bool)

(declare-fun e!68988 () Bool)

(assert (=> d!32990 e!68988))

(declare-fun res!86733 () Bool)

(assert (=> d!32990 (=> (not res!86733) (not e!68988))))

(declare-fun lt!155179 () (_ BitVec 64))

(declare-fun lt!155177 () (_ BitVec 64))

(declare-fun lt!155174 () (_ BitVec 64))

(assert (=> d!32990 (= res!86733 (= lt!155177 (bvsub lt!155179 lt!155174)))))

(assert (=> d!32990 (or (= (bvand lt!155179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155174 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155179 lt!155174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32990 (= lt!155174 (remainingBits!0 ((_ sign_extend 32) (size!2226 (buf!2597 (_1!4590 lt!154859)))) ((_ sign_extend 32) (currentByte!5090 (_1!4590 lt!154859))) ((_ sign_extend 32) (currentBit!5085 (_1!4590 lt!154859)))))))

(declare-fun lt!155175 () (_ BitVec 64))

(declare-fun lt!155176 () (_ BitVec 64))

(assert (=> d!32990 (= lt!155179 (bvmul lt!155175 lt!155176))))

(assert (=> d!32990 (or (= lt!155175 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!155176 (bvsdiv (bvmul lt!155175 lt!155176) lt!155175)))))

(assert (=> d!32990 (= lt!155176 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32990 (= lt!155175 ((_ sign_extend 32) (size!2226 (buf!2597 (_1!4590 lt!154859)))))))

(assert (=> d!32990 (= lt!155177 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5090 (_1!4590 lt!154859))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5085 (_1!4590 lt!154859)))))))

(assert (=> d!32990 (invariant!0 (currentBit!5085 (_1!4590 lt!154859)) (currentByte!5090 (_1!4590 lt!154859)) (size!2226 (buf!2597 (_1!4590 lt!154859))))))

(assert (=> d!32990 (= (bitIndex!0 (size!2226 (buf!2597 (_1!4590 lt!154859))) (currentByte!5090 (_1!4590 lt!154859)) (currentBit!5085 (_1!4590 lt!154859))) lt!155177)))

(declare-fun b!105326 () Bool)

(declare-fun res!86732 () Bool)

(assert (=> b!105326 (=> (not res!86732) (not e!68988))))

(assert (=> b!105326 (= res!86732 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155177))))

(declare-fun b!105327 () Bool)

(declare-fun lt!155178 () (_ BitVec 64))

(assert (=> b!105327 (= e!68988 (bvsle lt!155177 (bvmul lt!155178 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105327 (or (= lt!155178 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!155178 #b0000000000000000000000000000000000000000000000000000000000001000) lt!155178)))))

(assert (=> b!105327 (= lt!155178 ((_ sign_extend 32) (size!2226 (buf!2597 (_1!4590 lt!154859)))))))

(assert (= (and d!32990 res!86733) b!105326))

(assert (= (and b!105326 res!86732) b!105327))

(declare-fun m!154747 () Bool)

(assert (=> d!32990 m!154747))

(declare-fun m!154749 () Bool)

(assert (=> d!32990 m!154749))

(assert (=> b!105227 d!32990))

(declare-fun b!105364 () Bool)

(declare-fun lt!155318 () tuple2!8668)

(declare-fun lt!155326 () (_ BitVec 64))

(declare-fun lt!155317 () (_ BitVec 64))

(declare-fun e!69008 () Bool)

(assert (=> b!105364 (= e!69008 (= (_1!4591 lt!155318) (withMovedBitIndex!0 (_2!4591 lt!155318) (bvsub lt!155326 lt!155317))))))

(assert (=> b!105364 (or (= (bvand lt!155326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155317 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155326 lt!155317) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105364 (= lt!155317 (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154854))) (currentByte!5090 (_2!4592 lt!154854)) (currentBit!5085 (_2!4592 lt!154854))))))

(assert (=> b!105364 (= lt!155326 (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154864))) (currentByte!5090 (_2!4592 lt!154864)) (currentBit!5085 (_2!4592 lt!154864))))))

(declare-fun b!105365 () Bool)

(declare-fun res!86759 () Bool)

(assert (=> b!105365 (=> (not res!86759) (not e!69008))))

(assert (=> b!105365 (= res!86759 (isPrefixOf!0 (_2!4591 lt!155318) (_2!4592 lt!154854)))))

(declare-fun d!32992 () Bool)

(assert (=> d!32992 e!69008))

(declare-fun res!86758 () Bool)

(assert (=> d!32992 (=> (not res!86758) (not e!69008))))

(assert (=> d!32992 (= res!86758 (isPrefixOf!0 (_1!4591 lt!155318) (_2!4591 lt!155318)))))

(declare-fun lt!155310 () BitStream!3926)

(assert (=> d!32992 (= lt!155318 (tuple2!8669 lt!155310 (_2!4592 lt!154854)))))

(declare-fun lt!155311 () Unit!6450)

(declare-fun lt!155315 () Unit!6450)

(assert (=> d!32992 (= lt!155311 lt!155315)))

(assert (=> d!32992 (isPrefixOf!0 lt!155310 (_2!4592 lt!154854))))

(assert (=> d!32992 (= lt!155315 (lemmaIsPrefixTransitive!0 lt!155310 (_2!4592 lt!154854) (_2!4592 lt!154854)))))

(declare-fun lt!155313 () Unit!6450)

(declare-fun lt!155316 () Unit!6450)

(assert (=> d!32992 (= lt!155313 lt!155316)))

(assert (=> d!32992 (isPrefixOf!0 lt!155310 (_2!4592 lt!154854))))

(assert (=> d!32992 (= lt!155316 (lemmaIsPrefixTransitive!0 lt!155310 (_2!4592 lt!154864) (_2!4592 lt!154854)))))

(declare-fun lt!155312 () Unit!6450)

(declare-fun e!69007 () Unit!6450)

(assert (=> d!32992 (= lt!155312 e!69007)))

(declare-fun c!6501 () Bool)

(assert (=> d!32992 (= c!6501 (not (= (size!2226 (buf!2597 (_2!4592 lt!154864))) #b00000000000000000000000000000000)))))

(declare-fun lt!155323 () Unit!6450)

(declare-fun lt!155314 () Unit!6450)

(assert (=> d!32992 (= lt!155323 lt!155314)))

(assert (=> d!32992 (isPrefixOf!0 (_2!4592 lt!154854) (_2!4592 lt!154854))))

(assert (=> d!32992 (= lt!155314 (lemmaIsPrefixRefl!0 (_2!4592 lt!154854)))))

(declare-fun lt!155320 () Unit!6450)

(declare-fun lt!155319 () Unit!6450)

(assert (=> d!32992 (= lt!155320 lt!155319)))

(assert (=> d!32992 (= lt!155319 (lemmaIsPrefixRefl!0 (_2!4592 lt!154854)))))

(declare-fun lt!155322 () Unit!6450)

(declare-fun lt!155329 () Unit!6450)

(assert (=> d!32992 (= lt!155322 lt!155329)))

(assert (=> d!32992 (isPrefixOf!0 lt!155310 lt!155310)))

(assert (=> d!32992 (= lt!155329 (lemmaIsPrefixRefl!0 lt!155310))))

(declare-fun lt!155321 () Unit!6450)

(declare-fun lt!155328 () Unit!6450)

(assert (=> d!32992 (= lt!155321 lt!155328)))

(assert (=> d!32992 (isPrefixOf!0 (_2!4592 lt!154864) (_2!4592 lt!154864))))

(assert (=> d!32992 (= lt!155328 (lemmaIsPrefixRefl!0 (_2!4592 lt!154864)))))

(assert (=> d!32992 (= lt!155310 (BitStream!3927 (buf!2597 (_2!4592 lt!154854)) (currentByte!5090 (_2!4592 lt!154864)) (currentBit!5085 (_2!4592 lt!154864))))))

(assert (=> d!32992 (isPrefixOf!0 (_2!4592 lt!154864) (_2!4592 lt!154854))))

(assert (=> d!32992 (= (reader!0 (_2!4592 lt!154864) (_2!4592 lt!154854)) lt!155318)))

(declare-fun b!105366 () Bool)

(declare-fun Unit!6466 () Unit!6450)

(assert (=> b!105366 (= e!69007 Unit!6466)))

(declare-fun b!105367 () Bool)

(declare-fun lt!155324 () Unit!6450)

(assert (=> b!105367 (= e!69007 lt!155324)))

(declare-fun lt!155327 () (_ BitVec 64))

(assert (=> b!105367 (= lt!155327 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!155325 () (_ BitVec 64))

(assert (=> b!105367 (= lt!155325 (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154864))) (currentByte!5090 (_2!4592 lt!154864)) (currentBit!5085 (_2!4592 lt!154864))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4879 array!4879 (_ BitVec 64) (_ BitVec 64)) Unit!6450)

(assert (=> b!105367 (= lt!155324 (arrayBitRangesEqSymmetric!0 (buf!2597 (_2!4592 lt!154864)) (buf!2597 (_2!4592 lt!154854)) lt!155327 lt!155325))))

(declare-fun arrayBitRangesEq!0 (array!4879 array!4879 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!105367 (arrayBitRangesEq!0 (buf!2597 (_2!4592 lt!154854)) (buf!2597 (_2!4592 lt!154864)) lt!155327 lt!155325)))

(declare-fun b!105368 () Bool)

(declare-fun res!86760 () Bool)

(assert (=> b!105368 (=> (not res!86760) (not e!69008))))

(assert (=> b!105368 (= res!86760 (isPrefixOf!0 (_1!4591 lt!155318) (_2!4592 lt!154864)))))

(assert (= (and d!32992 c!6501) b!105367))

(assert (= (and d!32992 (not c!6501)) b!105366))

(assert (= (and d!32992 res!86758) b!105368))

(assert (= (and b!105368 res!86760) b!105365))

(assert (= (and b!105365 res!86759) b!105364))

(declare-fun m!154751 () Bool)

(assert (=> b!105365 m!154751))

(declare-fun m!154753 () Bool)

(assert (=> b!105364 m!154753))

(assert (=> b!105364 m!154473))

(assert (=> b!105364 m!154535))

(assert (=> b!105367 m!154535))

(declare-fun m!154755 () Bool)

(assert (=> b!105367 m!154755))

(declare-fun m!154757 () Bool)

(assert (=> b!105367 m!154757))

(declare-fun m!154759 () Bool)

(assert (=> b!105368 m!154759))

(declare-fun m!154761 () Bool)

(assert (=> d!32992 m!154761))

(declare-fun m!154763 () Bool)

(assert (=> d!32992 m!154763))

(declare-fun m!154765 () Bool)

(assert (=> d!32992 m!154765))

(declare-fun m!154767 () Bool)

(assert (=> d!32992 m!154767))

(declare-fun m!154769 () Bool)

(assert (=> d!32992 m!154769))

(declare-fun m!154771 () Bool)

(assert (=> d!32992 m!154771))

(declare-fun m!154773 () Bool)

(assert (=> d!32992 m!154773))

(declare-fun m!154775 () Bool)

(assert (=> d!32992 m!154775))

(declare-fun m!154777 () Bool)

(assert (=> d!32992 m!154777))

(declare-fun m!154779 () Bool)

(assert (=> d!32992 m!154779))

(declare-fun m!154781 () Bool)

(assert (=> d!32992 m!154781))

(assert (=> b!105227 d!32992))

(declare-fun lt!155330 () tuple2!8676)

(declare-fun d!32994 () Bool)

(assert (=> d!32994 (= lt!155330 (readNLeastSignificantBitsLoop!0 (_1!4591 lt!154860) nBits!396 i!615 lt!154847))))

(assert (=> d!32994 (= (readNLeastSignificantBitsLoopPure!0 (_1!4591 lt!154860) nBits!396 i!615 lt!154847) (tuple2!8673 (_2!4595 lt!155330) (_1!4595 lt!155330)))))

(declare-fun bs!8062 () Bool)

(assert (= bs!8062 d!32994))

(declare-fun m!154783 () Bool)

(assert (=> bs!8062 m!154783))

(assert (=> b!105227 d!32994))

(declare-fun d!32996 () Bool)

(assert (=> d!32996 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154854)))) ((_ sign_extend 32) (currentByte!5090 (_2!4592 lt!154864))) ((_ sign_extend 32) (currentBit!5085 (_2!4592 lt!154864))) lt!154844) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154854)))) ((_ sign_extend 32) (currentByte!5090 (_2!4592 lt!154864))) ((_ sign_extend 32) (currentBit!5085 (_2!4592 lt!154864)))) lt!154844))))

(declare-fun bs!8063 () Bool)

(assert (= bs!8063 d!32996))

(declare-fun m!154785 () Bool)

(assert (=> bs!8063 m!154785))

(assert (=> b!105227 d!32996))

(declare-fun d!32998 () Bool)

(declare-fun lt!155331 () tuple2!8680)

(assert (=> d!32998 (= lt!155331 (readBit!0 lt!154848))))

(assert (=> d!32998 (= (readBitPure!0 lt!154848) (tuple2!8667 (_2!4597 lt!155331) (_1!4597 lt!155331)))))

(declare-fun bs!8064 () Bool)

(assert (= bs!8064 d!32998))

(declare-fun m!154787 () Bool)

(assert (=> bs!8064 m!154787))

(assert (=> b!105227 d!32998))

(declare-fun d!33000 () Bool)

(declare-fun res!86778 () Bool)

(declare-fun e!69021 () Bool)

(assert (=> d!33000 (=> (not res!86778) (not e!69021))))

(assert (=> d!33000 (= res!86778 (= (size!2226 (buf!2597 thiss!1305)) (size!2226 (buf!2597 (_2!4592 lt!154854)))))))

(assert (=> d!33000 (= (isPrefixOf!0 thiss!1305 (_2!4592 lt!154854)) e!69021)))

(declare-fun b!105388 () Bool)

(declare-fun res!86777 () Bool)

(assert (=> b!105388 (=> (not res!86777) (not e!69021))))

(assert (=> b!105388 (= res!86777 (bvsle (bitIndex!0 (size!2226 (buf!2597 thiss!1305)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)) (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154854))) (currentByte!5090 (_2!4592 lt!154854)) (currentBit!5085 (_2!4592 lt!154854)))))))

(declare-fun b!105389 () Bool)

(declare-fun e!69020 () Bool)

(assert (=> b!105389 (= e!69021 e!69020)))

(declare-fun res!86776 () Bool)

(assert (=> b!105389 (=> res!86776 e!69020)))

(assert (=> b!105389 (= res!86776 (= (size!2226 (buf!2597 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!105390 () Bool)

(assert (=> b!105390 (= e!69020 (arrayBitRangesEq!0 (buf!2597 thiss!1305) (buf!2597 (_2!4592 lt!154854)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2226 (buf!2597 thiss!1305)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305))))))

(assert (= (and d!33000 res!86778) b!105388))

(assert (= (and b!105388 res!86777) b!105389))

(assert (= (and b!105389 (not res!86776)) b!105390))

(assert (=> b!105388 m!154479))

(assert (=> b!105388 m!154473))

(assert (=> b!105390 m!154479))

(assert (=> b!105390 m!154479))

(declare-fun m!154789 () Bool)

(assert (=> b!105390 m!154789))

(assert (=> b!105227 d!33000))

(declare-fun d!33002 () Bool)

(declare-fun e!69022 () Bool)

(assert (=> d!33002 e!69022))

(declare-fun res!86780 () Bool)

(assert (=> d!33002 (=> (not res!86780) (not e!69022))))

(declare-fun lt!155380 () (_ BitVec 64))

(declare-fun lt!155382 () (_ BitVec 64))

(declare-fun lt!155377 () (_ BitVec 64))

(assert (=> d!33002 (= res!86780 (= lt!155380 (bvsub lt!155382 lt!155377)))))

(assert (=> d!33002 (or (= (bvand lt!155382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155377 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155382 lt!155377) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33002 (= lt!155377 (remainingBits!0 ((_ sign_extend 32) (size!2226 (buf!2597 (_1!4590 lt!154866)))) ((_ sign_extend 32) (currentByte!5090 (_1!4590 lt!154866))) ((_ sign_extend 32) (currentBit!5085 (_1!4590 lt!154866)))))))

(declare-fun lt!155378 () (_ BitVec 64))

(declare-fun lt!155379 () (_ BitVec 64))

(assert (=> d!33002 (= lt!155382 (bvmul lt!155378 lt!155379))))

(assert (=> d!33002 (or (= lt!155378 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!155379 (bvsdiv (bvmul lt!155378 lt!155379) lt!155378)))))

(assert (=> d!33002 (= lt!155379 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33002 (= lt!155378 ((_ sign_extend 32) (size!2226 (buf!2597 (_1!4590 lt!154866)))))))

(assert (=> d!33002 (= lt!155380 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5090 (_1!4590 lt!154866))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5085 (_1!4590 lt!154866)))))))

(assert (=> d!33002 (invariant!0 (currentBit!5085 (_1!4590 lt!154866)) (currentByte!5090 (_1!4590 lt!154866)) (size!2226 (buf!2597 (_1!4590 lt!154866))))))

(assert (=> d!33002 (= (bitIndex!0 (size!2226 (buf!2597 (_1!4590 lt!154866))) (currentByte!5090 (_1!4590 lt!154866)) (currentBit!5085 (_1!4590 lt!154866))) lt!155380)))

(declare-fun b!105391 () Bool)

(declare-fun res!86779 () Bool)

(assert (=> b!105391 (=> (not res!86779) (not e!69022))))

(assert (=> b!105391 (= res!86779 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155380))))

(declare-fun b!105392 () Bool)

(declare-fun lt!155381 () (_ BitVec 64))

(assert (=> b!105392 (= e!69022 (bvsle lt!155380 (bvmul lt!155381 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105392 (or (= lt!155381 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!155381 #b0000000000000000000000000000000000000000000000000000000000001000) lt!155381)))))

(assert (=> b!105392 (= lt!155381 ((_ sign_extend 32) (size!2226 (buf!2597 (_1!4590 lt!154866)))))))

(assert (= (and d!33002 res!86780) b!105391))

(assert (= (and b!105391 res!86779) b!105392))

(declare-fun m!154791 () Bool)

(assert (=> d!33002 m!154791))

(declare-fun m!154793 () Bool)

(assert (=> d!33002 m!154793))

(assert (=> b!105227 d!33002))

(declare-fun d!33004 () Bool)

(declare-fun e!69031 () Bool)

(assert (=> d!33004 e!69031))

(declare-fun res!86797 () Bool)

(assert (=> d!33004 (=> (not res!86797) (not e!69031))))

(declare-fun lt!155402 () tuple2!8670)

(assert (=> d!33004 (= res!86797 (= (size!2226 (buf!2597 thiss!1305)) (size!2226 (buf!2597 (_2!4592 lt!155402)))))))

(declare-fun choose!16 (BitStream!3926 Bool) tuple2!8670)

(assert (=> d!33004 (= lt!155402 (choose!16 thiss!1305 lt!154845))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!33004 (validate_offset_bit!0 ((_ sign_extend 32) (size!2226 (buf!2597 thiss!1305))) ((_ sign_extend 32) (currentByte!5090 thiss!1305)) ((_ sign_extend 32) (currentBit!5085 thiss!1305)))))

(assert (=> d!33004 (= (appendBit!0 thiss!1305 lt!154845) lt!155402)))

(declare-fun b!105412 () Bool)

(declare-fun res!86799 () Bool)

(assert (=> b!105412 (=> (not res!86799) (not e!69031))))

(assert (=> b!105412 (= res!86799 (isPrefixOf!0 thiss!1305 (_2!4592 lt!155402)))))

(declare-fun b!105413 () Bool)

(declare-fun e!69032 () Bool)

(assert (=> b!105413 (= e!69031 e!69032)))

(declare-fun res!86798 () Bool)

(assert (=> b!105413 (=> (not res!86798) (not e!69032))))

(declare-fun lt!155401 () tuple2!8666)

(assert (=> b!105413 (= res!86798 (and (= (_2!4590 lt!155401) lt!154845) (= (_1!4590 lt!155401) (_2!4592 lt!155402))))))

(assert (=> b!105413 (= lt!155401 (readBitPure!0 (readerFrom!0 (_2!4592 lt!155402) (currentBit!5085 thiss!1305) (currentByte!5090 thiss!1305))))))

(declare-fun b!105414 () Bool)

(assert (=> b!105414 (= e!69032 (= (bitIndex!0 (size!2226 (buf!2597 (_1!4590 lt!155401))) (currentByte!5090 (_1!4590 lt!155401)) (currentBit!5085 (_1!4590 lt!155401))) (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!155402))) (currentByte!5090 (_2!4592 lt!155402)) (currentBit!5085 (_2!4592 lt!155402)))))))

(declare-fun b!105411 () Bool)

(declare-fun res!86800 () Bool)

(assert (=> b!105411 (=> (not res!86800) (not e!69031))))

(declare-fun lt!155399 () (_ BitVec 64))

(declare-fun lt!155400 () (_ BitVec 64))

(assert (=> b!105411 (= res!86800 (= (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!155402))) (currentByte!5090 (_2!4592 lt!155402)) (currentBit!5085 (_2!4592 lt!155402))) (bvadd lt!155400 lt!155399)))))

(assert (=> b!105411 (or (not (= (bvand lt!155400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155399 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!155400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!155400 lt!155399) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105411 (= lt!155399 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!105411 (= lt!155400 (bitIndex!0 (size!2226 (buf!2597 thiss!1305)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)))))

(assert (= (and d!33004 res!86797) b!105411))

(assert (= (and b!105411 res!86800) b!105412))

(assert (= (and b!105412 res!86799) b!105413))

(assert (= (and b!105413 res!86798) b!105414))

(declare-fun m!154877 () Bool)

(assert (=> b!105412 m!154877))

(declare-fun m!154879 () Bool)

(assert (=> d!33004 m!154879))

(declare-fun m!154881 () Bool)

(assert (=> d!33004 m!154881))

(declare-fun m!154883 () Bool)

(assert (=> b!105414 m!154883))

(declare-fun m!154885 () Bool)

(assert (=> b!105414 m!154885))

(declare-fun m!154887 () Bool)

(assert (=> b!105413 m!154887))

(assert (=> b!105413 m!154887))

(declare-fun m!154889 () Bool)

(assert (=> b!105413 m!154889))

(assert (=> b!105411 m!154885))

(assert (=> b!105411 m!154479))

(assert (=> b!105227 d!33004))

(declare-fun d!33008 () Bool)

(assert (=> d!33008 (validate_offset_bits!1 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154854)))) ((_ sign_extend 32) (currentByte!5090 thiss!1305)) ((_ sign_extend 32) (currentBit!5085 thiss!1305)) lt!154855)))

(declare-fun lt!155403 () Unit!6450)

(assert (=> d!33008 (= lt!155403 (choose!9 thiss!1305 (buf!2597 (_2!4592 lt!154854)) lt!154855 (BitStream!3927 (buf!2597 (_2!4592 lt!154854)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305))))))

(assert (=> d!33008 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2597 (_2!4592 lt!154854)) lt!154855) lt!155403)))

(declare-fun bs!8065 () Bool)

(assert (= bs!8065 d!33008))

(assert (=> bs!8065 m!154509))

(declare-fun m!154891 () Bool)

(assert (=> bs!8065 m!154891))

(assert (=> b!105227 d!33008))

(declare-fun d!33010 () Bool)

(declare-fun e!69040 () Bool)

(assert (=> d!33010 e!69040))

(declare-fun res!86810 () Bool)

(assert (=> d!33010 (=> (not res!86810) (not e!69040))))

(declare-fun lt!155423 () tuple2!8666)

(declare-fun lt!155422 () tuple2!8666)

(assert (=> d!33010 (= res!86810 (= (bitIndex!0 (size!2226 (buf!2597 (_1!4590 lt!155423))) (currentByte!5090 (_1!4590 lt!155423)) (currentBit!5085 (_1!4590 lt!155423))) (bitIndex!0 (size!2226 (buf!2597 (_1!4590 lt!155422))) (currentByte!5090 (_1!4590 lt!155422)) (currentBit!5085 (_1!4590 lt!155422)))))))

(declare-fun lt!155420 () BitStream!3926)

(declare-fun lt!155421 () Unit!6450)

(declare-fun choose!50 (BitStream!3926 BitStream!3926 BitStream!3926 tuple2!8666 tuple2!8666 BitStream!3926 Bool tuple2!8666 tuple2!8666 BitStream!3926 Bool) Unit!6450)

(assert (=> d!33010 (= lt!155421 (choose!50 lt!154848 (_2!4592 lt!154854) lt!155420 lt!155423 (tuple2!8667 (_1!4590 lt!155423) (_2!4590 lt!155423)) (_1!4590 lt!155423) (_2!4590 lt!155423) lt!155422 (tuple2!8667 (_1!4590 lt!155422) (_2!4590 lt!155422)) (_1!4590 lt!155422) (_2!4590 lt!155422)))))

(assert (=> d!33010 (= lt!155422 (readBitPure!0 lt!155420))))

(assert (=> d!33010 (= lt!155423 (readBitPure!0 lt!154848))))

(assert (=> d!33010 (= lt!155420 (BitStream!3927 (buf!2597 (_2!4592 lt!154854)) (currentByte!5090 lt!154848) (currentBit!5085 lt!154848)))))

(assert (=> d!33010 (invariant!0 (currentBit!5085 lt!154848) (currentByte!5090 lt!154848) (size!2226 (buf!2597 (_2!4592 lt!154854))))))

(assert (=> d!33010 (= (readBitPrefixLemma!0 lt!154848 (_2!4592 lt!154854)) lt!155421)))

(declare-fun b!105425 () Bool)

(assert (=> b!105425 (= e!69040 (= (_2!4590 lt!155423) (_2!4590 lt!155422)))))

(assert (= (and d!33010 res!86810) b!105425))

(declare-fun m!154913 () Bool)

(assert (=> d!33010 m!154913))

(declare-fun m!154915 () Bool)

(assert (=> d!33010 m!154915))

(declare-fun m!154917 () Bool)

(assert (=> d!33010 m!154917))

(declare-fun m!154919 () Bool)

(assert (=> d!33010 m!154919))

(declare-fun m!154921 () Bool)

(assert (=> d!33010 m!154921))

(assert (=> d!33010 m!154507))

(assert (=> b!105227 d!33010))

(declare-fun d!33020 () Bool)

(assert (=> d!33020 (isPrefixOf!0 thiss!1305 (_2!4592 lt!154854))))

(declare-fun lt!155430 () Unit!6450)

(declare-fun choose!30 (BitStream!3926 BitStream!3926 BitStream!3926) Unit!6450)

(assert (=> d!33020 (= lt!155430 (choose!30 thiss!1305 (_2!4592 lt!154864) (_2!4592 lt!154854)))))

(assert (=> d!33020 (isPrefixOf!0 thiss!1305 (_2!4592 lt!154864))))

(assert (=> d!33020 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4592 lt!154864) (_2!4592 lt!154854)) lt!155430)))

(declare-fun bs!8068 () Bool)

(assert (= bs!8068 d!33020))

(assert (=> bs!8068 m!154513))

(declare-fun m!154923 () Bool)

(assert (=> bs!8068 m!154923))

(assert (=> bs!8068 m!154537))

(assert (=> b!105227 d!33020))

(declare-fun lt!155447 () (_ BitVec 64))

(declare-fun e!69044 () Bool)

(declare-fun lt!155438 () (_ BitVec 64))

(declare-fun b!105428 () Bool)

(declare-fun lt!155439 () tuple2!8668)

(assert (=> b!105428 (= e!69044 (= (_1!4591 lt!155439) (withMovedBitIndex!0 (_2!4591 lt!155439) (bvsub lt!155447 lt!155438))))))

(assert (=> b!105428 (or (= (bvand lt!155447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155438 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155447 lt!155438) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105428 (= lt!155438 (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154854))) (currentByte!5090 (_2!4592 lt!154854)) (currentBit!5085 (_2!4592 lt!154854))))))

(assert (=> b!105428 (= lt!155447 (bitIndex!0 (size!2226 (buf!2597 thiss!1305)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)))))

(declare-fun b!105429 () Bool)

(declare-fun res!86814 () Bool)

(assert (=> b!105429 (=> (not res!86814) (not e!69044))))

(assert (=> b!105429 (= res!86814 (isPrefixOf!0 (_2!4591 lt!155439) (_2!4592 lt!154854)))))

(declare-fun d!33022 () Bool)

(assert (=> d!33022 e!69044))

(declare-fun res!86813 () Bool)

(assert (=> d!33022 (=> (not res!86813) (not e!69044))))

(assert (=> d!33022 (= res!86813 (isPrefixOf!0 (_1!4591 lt!155439) (_2!4591 lt!155439)))))

(declare-fun lt!155431 () BitStream!3926)

(assert (=> d!33022 (= lt!155439 (tuple2!8669 lt!155431 (_2!4592 lt!154854)))))

(declare-fun lt!155432 () Unit!6450)

(declare-fun lt!155436 () Unit!6450)

(assert (=> d!33022 (= lt!155432 lt!155436)))

(assert (=> d!33022 (isPrefixOf!0 lt!155431 (_2!4592 lt!154854))))

(assert (=> d!33022 (= lt!155436 (lemmaIsPrefixTransitive!0 lt!155431 (_2!4592 lt!154854) (_2!4592 lt!154854)))))

(declare-fun lt!155434 () Unit!6450)

(declare-fun lt!155437 () Unit!6450)

(assert (=> d!33022 (= lt!155434 lt!155437)))

(assert (=> d!33022 (isPrefixOf!0 lt!155431 (_2!4592 lt!154854))))

(assert (=> d!33022 (= lt!155437 (lemmaIsPrefixTransitive!0 lt!155431 thiss!1305 (_2!4592 lt!154854)))))

(declare-fun lt!155433 () Unit!6450)

(declare-fun e!69043 () Unit!6450)

(assert (=> d!33022 (= lt!155433 e!69043)))

(declare-fun c!6504 () Bool)

(assert (=> d!33022 (= c!6504 (not (= (size!2226 (buf!2597 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!155444 () Unit!6450)

(declare-fun lt!155435 () Unit!6450)

(assert (=> d!33022 (= lt!155444 lt!155435)))

(assert (=> d!33022 (isPrefixOf!0 (_2!4592 lt!154854) (_2!4592 lt!154854))))

(assert (=> d!33022 (= lt!155435 (lemmaIsPrefixRefl!0 (_2!4592 lt!154854)))))

(declare-fun lt!155441 () Unit!6450)

(declare-fun lt!155440 () Unit!6450)

(assert (=> d!33022 (= lt!155441 lt!155440)))

(assert (=> d!33022 (= lt!155440 (lemmaIsPrefixRefl!0 (_2!4592 lt!154854)))))

(declare-fun lt!155443 () Unit!6450)

(declare-fun lt!155450 () Unit!6450)

(assert (=> d!33022 (= lt!155443 lt!155450)))

(assert (=> d!33022 (isPrefixOf!0 lt!155431 lt!155431)))

(assert (=> d!33022 (= lt!155450 (lemmaIsPrefixRefl!0 lt!155431))))

(declare-fun lt!155442 () Unit!6450)

(declare-fun lt!155449 () Unit!6450)

(assert (=> d!33022 (= lt!155442 lt!155449)))

(assert (=> d!33022 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!33022 (= lt!155449 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!33022 (= lt!155431 (BitStream!3927 (buf!2597 (_2!4592 lt!154854)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)))))

(assert (=> d!33022 (isPrefixOf!0 thiss!1305 (_2!4592 lt!154854))))

(assert (=> d!33022 (= (reader!0 thiss!1305 (_2!4592 lt!154854)) lt!155439)))

(declare-fun b!105430 () Bool)

(declare-fun Unit!6467 () Unit!6450)

(assert (=> b!105430 (= e!69043 Unit!6467)))

(declare-fun b!105431 () Bool)

(declare-fun lt!155445 () Unit!6450)

(assert (=> b!105431 (= e!69043 lt!155445)))

(declare-fun lt!155448 () (_ BitVec 64))

(assert (=> b!105431 (= lt!155448 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!155446 () (_ BitVec 64))

(assert (=> b!105431 (= lt!155446 (bitIndex!0 (size!2226 (buf!2597 thiss!1305)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)))))

(assert (=> b!105431 (= lt!155445 (arrayBitRangesEqSymmetric!0 (buf!2597 thiss!1305) (buf!2597 (_2!4592 lt!154854)) lt!155448 lt!155446))))

(assert (=> b!105431 (arrayBitRangesEq!0 (buf!2597 (_2!4592 lt!154854)) (buf!2597 thiss!1305) lt!155448 lt!155446)))

(declare-fun b!105432 () Bool)

(declare-fun res!86815 () Bool)

(assert (=> b!105432 (=> (not res!86815) (not e!69044))))

(assert (=> b!105432 (= res!86815 (isPrefixOf!0 (_1!4591 lt!155439) thiss!1305))))

(assert (= (and d!33022 c!6504) b!105431))

(assert (= (and d!33022 (not c!6504)) b!105430))

(assert (= (and d!33022 res!86813) b!105432))

(assert (= (and b!105432 res!86815) b!105429))

(assert (= (and b!105429 res!86814) b!105428))

(declare-fun m!154925 () Bool)

(assert (=> b!105429 m!154925))

(declare-fun m!154927 () Bool)

(assert (=> b!105428 m!154927))

(assert (=> b!105428 m!154473))

(assert (=> b!105428 m!154479))

(assert (=> b!105431 m!154479))

(declare-fun m!154937 () Bool)

(assert (=> b!105431 m!154937))

(declare-fun m!154939 () Bool)

(assert (=> b!105431 m!154939))

(declare-fun m!154941 () Bool)

(assert (=> b!105432 m!154941))

(declare-fun m!154943 () Bool)

(assert (=> d!33022 m!154943))

(assert (=> d!33022 m!154513))

(declare-fun m!154945 () Bool)

(assert (=> d!33022 m!154945))

(declare-fun m!154947 () Bool)

(assert (=> d!33022 m!154947))

(assert (=> d!33022 m!154769))

(declare-fun m!154949 () Bool)

(assert (=> d!33022 m!154949))

(declare-fun m!154951 () Bool)

(assert (=> d!33022 m!154951))

(declare-fun m!154953 () Bool)

(assert (=> d!33022 m!154953))

(declare-fun m!154955 () Bool)

(assert (=> d!33022 m!154955))

(assert (=> d!33022 m!154779))

(declare-fun m!154959 () Bool)

(assert (=> d!33022 m!154959))

(assert (=> b!105227 d!33022))

(declare-fun d!33028 () Bool)

(assert (=> d!33028 (= (array_inv!2028 (buf!2597 thiss!1305)) (bvsge (size!2226 (buf!2597 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!105221 d!33028))

(declare-fun d!33030 () Bool)

(declare-fun e!69047 () Bool)

(assert (=> d!33030 e!69047))

(declare-fun res!86820 () Bool)

(assert (=> d!33030 (=> (not res!86820) (not e!69047))))

(declare-fun lt!155460 () (_ BitVec 64))

(declare-fun lt!155465 () (_ BitVec 64))

(declare-fun lt!155463 () (_ BitVec 64))

(assert (=> d!33030 (= res!86820 (= lt!155463 (bvsub lt!155465 lt!155460)))))

(assert (=> d!33030 (or (= (bvand lt!155465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155460 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155465 lt!155460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33030 (= lt!155460 (remainingBits!0 ((_ sign_extend 32) (size!2226 (buf!2597 (_1!4590 lt!154851)))) ((_ sign_extend 32) (currentByte!5090 (_1!4590 lt!154851))) ((_ sign_extend 32) (currentBit!5085 (_1!4590 lt!154851)))))))

(declare-fun lt!155461 () (_ BitVec 64))

(declare-fun lt!155462 () (_ BitVec 64))

(assert (=> d!33030 (= lt!155465 (bvmul lt!155461 lt!155462))))

(assert (=> d!33030 (or (= lt!155461 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!155462 (bvsdiv (bvmul lt!155461 lt!155462) lt!155461)))))

(assert (=> d!33030 (= lt!155462 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33030 (= lt!155461 ((_ sign_extend 32) (size!2226 (buf!2597 (_1!4590 lt!154851)))))))

(assert (=> d!33030 (= lt!155463 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5090 (_1!4590 lt!154851))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5085 (_1!4590 lt!154851)))))))

(assert (=> d!33030 (invariant!0 (currentBit!5085 (_1!4590 lt!154851)) (currentByte!5090 (_1!4590 lt!154851)) (size!2226 (buf!2597 (_1!4590 lt!154851))))))

(assert (=> d!33030 (= (bitIndex!0 (size!2226 (buf!2597 (_1!4590 lt!154851))) (currentByte!5090 (_1!4590 lt!154851)) (currentBit!5085 (_1!4590 lt!154851))) lt!155463)))

(declare-fun b!105436 () Bool)

(declare-fun res!86819 () Bool)

(assert (=> b!105436 (=> (not res!86819) (not e!69047))))

(assert (=> b!105436 (= res!86819 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155463))))

(declare-fun b!105437 () Bool)

(declare-fun lt!155464 () (_ BitVec 64))

(assert (=> b!105437 (= e!69047 (bvsle lt!155463 (bvmul lt!155464 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105437 (or (= lt!155464 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!155464 #b0000000000000000000000000000000000000000000000000000000000001000) lt!155464)))))

(assert (=> b!105437 (= lt!155464 ((_ sign_extend 32) (size!2226 (buf!2597 (_1!4590 lt!154851)))))))

(assert (= (and d!33030 res!86820) b!105436))

(assert (= (and b!105436 res!86819) b!105437))

(declare-fun m!154965 () Bool)

(assert (=> d!33030 m!154965))

(declare-fun m!154967 () Bool)

(assert (=> d!33030 m!154967))

(assert (=> b!105220 d!33030))

(declare-fun d!33034 () Bool)

(declare-fun res!86823 () Bool)

(declare-fun e!69049 () Bool)

(assert (=> d!33034 (=> (not res!86823) (not e!69049))))

(assert (=> d!33034 (= res!86823 (= (size!2226 (buf!2597 thiss!1305)) (size!2226 (buf!2597 (_2!4592 lt!154864)))))))

(assert (=> d!33034 (= (isPrefixOf!0 thiss!1305 (_2!4592 lt!154864)) e!69049)))

(declare-fun b!105438 () Bool)

(declare-fun res!86822 () Bool)

(assert (=> b!105438 (=> (not res!86822) (not e!69049))))

(assert (=> b!105438 (= res!86822 (bvsle (bitIndex!0 (size!2226 (buf!2597 thiss!1305)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)) (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154864))) (currentByte!5090 (_2!4592 lt!154864)) (currentBit!5085 (_2!4592 lt!154864)))))))

(declare-fun b!105439 () Bool)

(declare-fun e!69048 () Bool)

(assert (=> b!105439 (= e!69049 e!69048)))

(declare-fun res!86821 () Bool)

(assert (=> b!105439 (=> res!86821 e!69048)))

(assert (=> b!105439 (= res!86821 (= (size!2226 (buf!2597 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!105440 () Bool)

(assert (=> b!105440 (= e!69048 (arrayBitRangesEq!0 (buf!2597 thiss!1305) (buf!2597 (_2!4592 lt!154864)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2226 (buf!2597 thiss!1305)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305))))))

(assert (= (and d!33034 res!86823) b!105438))

(assert (= (and b!105438 res!86822) b!105439))

(assert (= (and b!105439 (not res!86821)) b!105440))

(assert (=> b!105438 m!154479))

(assert (=> b!105438 m!154535))

(assert (=> b!105440 m!154479))

(assert (=> b!105440 m!154479))

(declare-fun m!154969 () Bool)

(assert (=> b!105440 m!154969))

(assert (=> b!105230 d!33034))

(declare-fun d!33036 () Bool)

(assert (=> d!33036 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!105219 d!33036))

(declare-fun d!33038 () Bool)

(declare-fun lt!155466 () tuple2!8680)

(assert (=> d!33038 (= lt!155466 (readBit!0 (readerFrom!0 (_2!4592 lt!154864) (currentBit!5085 thiss!1305) (currentByte!5090 thiss!1305))))))

(assert (=> d!33038 (= (readBitPure!0 (readerFrom!0 (_2!4592 lt!154864) (currentBit!5085 thiss!1305) (currentByte!5090 thiss!1305))) (tuple2!8667 (_2!4597 lt!155466) (_1!4597 lt!155466)))))

(declare-fun bs!8070 () Bool)

(assert (= bs!8070 d!33038))

(assert (=> bs!8070 m!154491))

(declare-fun m!154971 () Bool)

(assert (=> bs!8070 m!154971))

(assert (=> b!105223 d!33038))

(declare-fun d!33040 () Bool)

(declare-fun e!69052 () Bool)

(assert (=> d!33040 e!69052))

(declare-fun res!86827 () Bool)

(assert (=> d!33040 (=> (not res!86827) (not e!69052))))

(assert (=> d!33040 (= res!86827 (invariant!0 (currentBit!5085 (_2!4592 lt!154864)) (currentByte!5090 (_2!4592 lt!154864)) (size!2226 (buf!2597 (_2!4592 lt!154864)))))))

(assert (=> d!33040 (= (readerFrom!0 (_2!4592 lt!154864) (currentBit!5085 thiss!1305) (currentByte!5090 thiss!1305)) (BitStream!3927 (buf!2597 (_2!4592 lt!154864)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)))))

(declare-fun b!105443 () Bool)

(assert (=> b!105443 (= e!69052 (invariant!0 (currentBit!5085 thiss!1305) (currentByte!5090 thiss!1305) (size!2226 (buf!2597 (_2!4592 lt!154864)))))))

(assert (= (and d!33040 res!86827) b!105443))

(declare-fun m!154973 () Bool)

(assert (=> d!33040 m!154973))

(assert (=> b!105443 m!154487))

(assert (=> b!105223 d!33040))

(declare-fun d!33042 () Bool)

(assert (=> d!33042 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5085 thiss!1305) (currentByte!5090 thiss!1305) (size!2226 (buf!2597 thiss!1305))))))

(declare-fun bs!8071 () Bool)

(assert (= bs!8071 d!33042))

(declare-fun m!154975 () Bool)

(assert (=> bs!8071 m!154975))

(assert (=> start!20782 d!33042))

(declare-fun lt!155467 () tuple2!8676)

(declare-fun d!33044 () Bool)

(assert (=> d!33044 (= lt!155467 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4591 lt!154860) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154846))))

(assert (=> d!33044 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4591 lt!154860) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154846) (tuple2!8673 (_2!4595 lt!155467) (_1!4595 lt!155467)))))

(declare-fun bs!8072 () Bool)

(assert (= bs!8072 d!33044))

(assert (=> bs!8072 m!154475))

(declare-fun m!154977 () Bool)

(assert (=> bs!8072 m!154977))

(assert (=> b!105222 d!33044))

(declare-fun d!33046 () Bool)

(declare-fun e!69053 () Bool)

(assert (=> d!33046 e!69053))

(declare-fun res!86829 () Bool)

(assert (=> d!33046 (=> (not res!86829) (not e!69053))))

(declare-fun lt!155468 () (_ BitVec 64))

(declare-fun lt!155471 () (_ BitVec 64))

(declare-fun lt!155473 () (_ BitVec 64))

(assert (=> d!33046 (= res!86829 (= lt!155471 (bvsub lt!155473 lt!155468)))))

(assert (=> d!33046 (or (= (bvand lt!155473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155468 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155473 lt!155468) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33046 (= lt!155468 (remainingBits!0 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154854)))) ((_ sign_extend 32) (currentByte!5090 (_2!4592 lt!154854))) ((_ sign_extend 32) (currentBit!5085 (_2!4592 lt!154854)))))))

(declare-fun lt!155469 () (_ BitVec 64))

(declare-fun lt!155470 () (_ BitVec 64))

(assert (=> d!33046 (= lt!155473 (bvmul lt!155469 lt!155470))))

(assert (=> d!33046 (or (= lt!155469 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!155470 (bvsdiv (bvmul lt!155469 lt!155470) lt!155469)))))

(assert (=> d!33046 (= lt!155470 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33046 (= lt!155469 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154854)))))))

(assert (=> d!33046 (= lt!155471 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5090 (_2!4592 lt!154854))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5085 (_2!4592 lt!154854)))))))

(assert (=> d!33046 (invariant!0 (currentBit!5085 (_2!4592 lt!154854)) (currentByte!5090 (_2!4592 lt!154854)) (size!2226 (buf!2597 (_2!4592 lt!154854))))))

(assert (=> d!33046 (= (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154854))) (currentByte!5090 (_2!4592 lt!154854)) (currentBit!5085 (_2!4592 lt!154854))) lt!155471)))

(declare-fun b!105444 () Bool)

(declare-fun res!86828 () Bool)

(assert (=> b!105444 (=> (not res!86828) (not e!69053))))

(assert (=> b!105444 (= res!86828 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155471))))

(declare-fun b!105445 () Bool)

(declare-fun lt!155472 () (_ BitVec 64))

(assert (=> b!105445 (= e!69053 (bvsle lt!155471 (bvmul lt!155472 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105445 (or (= lt!155472 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!155472 #b0000000000000000000000000000000000000000000000000000000000001000) lt!155472)))))

(assert (=> b!105445 (= lt!155472 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154854)))))))

(assert (= (and d!33046 res!86829) b!105444))

(assert (= (and b!105444 res!86828) b!105445))

(declare-fun m!154979 () Bool)

(assert (=> d!33046 m!154979))

(declare-fun m!154981 () Bool)

(assert (=> d!33046 m!154981))

(assert (=> b!105222 d!33046))

(declare-fun d!33048 () Bool)

(declare-fun lt!155506 () tuple2!8672)

(declare-fun lt!155504 () tuple2!8672)

(assert (=> d!33048 (and (= (_2!4593 lt!155506) (_2!4593 lt!155504)) (= (_1!4593 lt!155506) (_1!4593 lt!155504)))))

(declare-fun lt!155505 () (_ BitVec 64))

(declare-fun lt!155508 () Unit!6450)

(declare-fun lt!155509 () Bool)

(declare-fun lt!155507 () BitStream!3926)

(declare-fun choose!45 (BitStream!3926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8672 tuple2!8672 BitStream!3926 (_ BitVec 64) Bool BitStream!3926 (_ BitVec 64) tuple2!8672 tuple2!8672 BitStream!3926 (_ BitVec 64)) Unit!6450)

(assert (=> d!33048 (= lt!155508 (choose!45 (_1!4591 lt!154860) nBits!396 i!615 lt!154847 lt!155506 (tuple2!8673 (_1!4593 lt!155506) (_2!4593 lt!155506)) (_1!4593 lt!155506) (_2!4593 lt!155506) lt!155509 lt!155507 lt!155505 lt!155504 (tuple2!8673 (_1!4593 lt!155504) (_2!4593 lt!155504)) (_1!4593 lt!155504) (_2!4593 lt!155504)))))

(assert (=> d!33048 (= lt!155504 (readNLeastSignificantBitsLoopPure!0 lt!155507 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!155505))))

(assert (=> d!33048 (= lt!155505 (bvor lt!154847 (ite lt!155509 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33048 (= lt!155507 (withMovedBitIndex!0 (_1!4591 lt!154860) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!33048 (= lt!155509 (_2!4590 (readBitPure!0 (_1!4591 lt!154860))))))

(assert (=> d!33048 (= lt!155506 (readNLeastSignificantBitsLoopPure!0 (_1!4591 lt!154860) nBits!396 i!615 lt!154847))))

(assert (=> d!33048 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4591 lt!154860) nBits!396 i!615 lt!154847) lt!155508)))

(declare-fun bs!8076 () Bool)

(assert (= bs!8076 d!33048))

(assert (=> bs!8076 m!154533))

(assert (=> bs!8076 m!154529))

(assert (=> bs!8076 m!154475))

(declare-fun m!154987 () Bool)

(assert (=> bs!8076 m!154987))

(declare-fun m!154989 () Bool)

(assert (=> bs!8076 m!154989))

(assert (=> b!105222 d!33048))

(declare-fun d!33050 () Bool)

(declare-fun e!69054 () Bool)

(assert (=> d!33050 e!69054))

(declare-fun res!86831 () Bool)

(assert (=> d!33050 (=> (not res!86831) (not e!69054))))

(declare-fun lt!155513 () (_ BitVec 64))

(declare-fun lt!155510 () (_ BitVec 64))

(declare-fun lt!155515 () (_ BitVec 64))

(assert (=> d!33050 (= res!86831 (= lt!155513 (bvsub lt!155515 lt!155510)))))

(assert (=> d!33050 (or (= (bvand lt!155515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155510 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155515 lt!155510) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33050 (= lt!155510 (remainingBits!0 ((_ sign_extend 32) (size!2226 (buf!2597 thiss!1305))) ((_ sign_extend 32) (currentByte!5090 thiss!1305)) ((_ sign_extend 32) (currentBit!5085 thiss!1305))))))

(declare-fun lt!155511 () (_ BitVec 64))

(declare-fun lt!155512 () (_ BitVec 64))

(assert (=> d!33050 (= lt!155515 (bvmul lt!155511 lt!155512))))

(assert (=> d!33050 (or (= lt!155511 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!155512 (bvsdiv (bvmul lt!155511 lt!155512) lt!155511)))))

(assert (=> d!33050 (= lt!155512 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33050 (= lt!155511 ((_ sign_extend 32) (size!2226 (buf!2597 thiss!1305))))))

(assert (=> d!33050 (= lt!155513 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5090 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5085 thiss!1305))))))

(assert (=> d!33050 (invariant!0 (currentBit!5085 thiss!1305) (currentByte!5090 thiss!1305) (size!2226 (buf!2597 thiss!1305)))))

(assert (=> d!33050 (= (bitIndex!0 (size!2226 (buf!2597 thiss!1305)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)) lt!155513)))

(declare-fun b!105446 () Bool)

(declare-fun res!86830 () Bool)

(assert (=> b!105446 (=> (not res!86830) (not e!69054))))

(assert (=> b!105446 (= res!86830 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155513))))

(declare-fun b!105447 () Bool)

(declare-fun lt!155514 () (_ BitVec 64))

(assert (=> b!105447 (= e!69054 (bvsle lt!155513 (bvmul lt!155514 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105447 (or (= lt!155514 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!155514 #b0000000000000000000000000000000000000000000000000000000000001000) lt!155514)))))

(assert (=> b!105447 (= lt!155514 ((_ sign_extend 32) (size!2226 (buf!2597 thiss!1305))))))

(assert (= (and d!33050 res!86831) b!105446))

(assert (= (and b!105446 res!86830) b!105447))

(assert (=> d!33050 m!154557))

(assert (=> d!33050 m!154975))

(assert (=> b!105222 d!33050))

(declare-fun d!33052 () Bool)

(declare-fun e!69057 () Bool)

(assert (=> d!33052 e!69057))

(declare-fun res!86834 () Bool)

(assert (=> d!33052 (=> (not res!86834) (not e!69057))))

(declare-fun lt!155521 () (_ BitVec 64))

(declare-fun lt!155520 () BitStream!3926)

(assert (=> d!33052 (= res!86834 (= (bvadd lt!155521 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2226 (buf!2597 lt!155520)) (currentByte!5090 lt!155520) (currentBit!5085 lt!155520))))))

(assert (=> d!33052 (or (not (= (bvand lt!155521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!155521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!155521 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33052 (= lt!155521 (bitIndex!0 (size!2226 (buf!2597 (_1!4591 lt!154860))) (currentByte!5090 (_1!4591 lt!154860)) (currentBit!5085 (_1!4591 lt!154860))))))

(declare-fun moveBitIndex!0 (BitStream!3926 (_ BitVec 64)) tuple2!8670)

(assert (=> d!33052 (= lt!155520 (_2!4592 (moveBitIndex!0 (_1!4591 lt!154860) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!33052 (moveBitIndexPrecond!0 (_1!4591 lt!154860) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!33052 (= (withMovedBitIndex!0 (_1!4591 lt!154860) #b0000000000000000000000000000000000000000000000000000000000000001) lt!155520)))

(declare-fun b!105450 () Bool)

(assert (=> b!105450 (= e!69057 (= (size!2226 (buf!2597 (_1!4591 lt!154860))) (size!2226 (buf!2597 lt!155520))))))

(assert (= (and d!33052 res!86834) b!105450))

(declare-fun m!154991 () Bool)

(assert (=> d!33052 m!154991))

(declare-fun m!154993 () Bool)

(assert (=> d!33052 m!154993))

(declare-fun m!154995 () Bool)

(assert (=> d!33052 m!154995))

(declare-fun m!154997 () Bool)

(assert (=> d!33052 m!154997))

(assert (=> b!105222 d!33052))

(declare-fun d!33054 () Bool)

(declare-fun res!86837 () Bool)

(declare-fun e!69060 () Bool)

(assert (=> d!33054 (=> (not res!86837) (not e!69060))))

(assert (=> d!33054 (= res!86837 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4591 lt!154860))))) (bvsub (bitIndex!0 (size!2226 (buf!2597 thiss!1305)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)) (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154854))) (currentByte!5090 (_2!4592 lt!154854)) (currentBit!5085 (_2!4592 lt!154854))))) (bvsle (bvsub (bitIndex!0 (size!2226 (buf!2597 thiss!1305)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)) (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154854))) (currentByte!5090 (_2!4592 lt!154854)) (currentBit!5085 (_2!4592 lt!154854)))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4591 lt!154860))))))))))

(assert (=> d!33054 (= (moveBitIndexPrecond!0 (_2!4591 lt!154860) (bvsub (bitIndex!0 (size!2226 (buf!2597 thiss!1305)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)) (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154854))) (currentByte!5090 (_2!4592 lt!154854)) (currentBit!5085 (_2!4592 lt!154854))))) e!69060)))

(declare-fun b!105454 () Bool)

(declare-fun lt!155524 () (_ BitVec 64))

(assert (=> b!105454 (= e!69060 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155524) (bvsle lt!155524 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4591 lt!154860))))))))))

(assert (=> b!105454 (= lt!155524 (bvadd (bitIndex!0 (size!2226 (buf!2597 (_2!4591 lt!154860))) (currentByte!5090 (_2!4591 lt!154860)) (currentBit!5085 (_2!4591 lt!154860))) (bvsub (bitIndex!0 (size!2226 (buf!2597 thiss!1305)) (currentByte!5090 thiss!1305) (currentBit!5085 thiss!1305)) (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154854))) (currentByte!5090 (_2!4592 lt!154854)) (currentBit!5085 (_2!4592 lt!154854))))))))

(assert (= (and d!33054 res!86837) b!105454))

(declare-fun m!155001 () Bool)

(assert (=> b!105454 m!155001))

(assert (=> b!105222 d!33054))

(declare-fun d!33060 () Bool)

(declare-fun e!69061 () Bool)

(assert (=> d!33060 e!69061))

(declare-fun res!86839 () Bool)

(assert (=> d!33060 (=> (not res!86839) (not e!69061))))

(declare-fun lt!155525 () (_ BitVec 64))

(declare-fun lt!155530 () (_ BitVec 64))

(declare-fun lt!155528 () (_ BitVec 64))

(assert (=> d!33060 (= res!86839 (= lt!155528 (bvsub lt!155530 lt!155525)))))

(assert (=> d!33060 (or (= (bvand lt!155530 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155525 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155530 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155530 lt!155525) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33060 (= lt!155525 (remainingBits!0 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154864)))) ((_ sign_extend 32) (currentByte!5090 (_2!4592 lt!154864))) ((_ sign_extend 32) (currentBit!5085 (_2!4592 lt!154864)))))))

(declare-fun lt!155526 () (_ BitVec 64))

(declare-fun lt!155527 () (_ BitVec 64))

(assert (=> d!33060 (= lt!155530 (bvmul lt!155526 lt!155527))))

(assert (=> d!33060 (or (= lt!155526 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!155527 (bvsdiv (bvmul lt!155526 lt!155527) lt!155526)))))

(assert (=> d!33060 (= lt!155527 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33060 (= lt!155526 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154864)))))))

(assert (=> d!33060 (= lt!155528 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5090 (_2!4592 lt!154864))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5085 (_2!4592 lt!154864)))))))

(assert (=> d!33060 (invariant!0 (currentBit!5085 (_2!4592 lt!154864)) (currentByte!5090 (_2!4592 lt!154864)) (size!2226 (buf!2597 (_2!4592 lt!154864))))))

(assert (=> d!33060 (= (bitIndex!0 (size!2226 (buf!2597 (_2!4592 lt!154864))) (currentByte!5090 (_2!4592 lt!154864)) (currentBit!5085 (_2!4592 lt!154864))) lt!155528)))

(declare-fun b!105455 () Bool)

(declare-fun res!86838 () Bool)

(assert (=> b!105455 (=> (not res!86838) (not e!69061))))

(assert (=> b!105455 (= res!86838 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155528))))

(declare-fun b!105456 () Bool)

(declare-fun lt!155529 () (_ BitVec 64))

(assert (=> b!105456 (= e!69061 (bvsle lt!155528 (bvmul lt!155529 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105456 (or (= lt!155529 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!155529 #b0000000000000000000000000000000000000000000000000000000000001000) lt!155529)))))

(assert (=> b!105456 (= lt!155529 ((_ sign_extend 32) (size!2226 (buf!2597 (_2!4592 lt!154864)))))))

(assert (= (and d!33060 res!86839) b!105455))

(assert (= (and b!105455 res!86838) b!105456))

(declare-fun m!155003 () Bool)

(assert (=> d!33060 m!155003))

(assert (=> d!33060 m!154973))

(assert (=> b!105224 d!33060))

(assert (=> b!105224 d!33050))

(push 1)

(assert (not b!105388))

(assert (not d!33052))

(assert (not b!105412))

(assert (not d!33046))

(assert (not d!32940))

(assert (not d!32998))

(assert (not b!105411))

(assert (not d!32982))

(assert (not d!33042))

(assert (not b!105315))

(assert (not d!33030))

(assert (not d!33004))

(assert (not d!32992))

(assert (not bm!1314))

(assert (not b!105443))

(assert (not b!105313))

(assert (not d!33002))

(assert (not b!105310))

(assert (not d!32996))

(assert (not b!105364))

(assert (not b!105440))

(assert (not b!105367))

(assert (not d!33044))

(assert (not d!32984))

(assert (not d!33022))

(assert (not b!105414))

(assert (not b!105309))

(assert (not b!105431))

(assert (not b!105318))

(assert (not d!32988))

(assert (not d!32990))

(assert (not d!33050))

(assert (not d!33010))

(assert (not b!105454))

(assert (not d!33008))

(assert (not d!33020))

(assert (not d!32986))

(assert (not d!33038))

(assert (not b!105429))

(assert (not b!105316))

(assert (not b!105432))

(assert (not b!105428))

(assert (not b!105317))

(assert (not d!33060))

(assert (not b!105438))

(assert (not b!105319))

(assert (not d!32994))

(assert (not b!105365))

(assert (not b!105320))

(assert (not b!105413))

(assert (not b!105368))

(assert (not d!32946))

(assert (not b!105390))

(assert (not d!33040))

(assert (not d!33048))

(assert (not b!105311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


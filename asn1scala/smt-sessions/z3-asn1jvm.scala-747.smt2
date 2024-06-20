; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21354 () Bool)

(assert start!21354)

(declare-fun b!107521 () Bool)

(declare-fun e!70373 () Bool)

(declare-fun e!70380 () Bool)

(assert (=> b!107521 (= e!70373 e!70380)))

(declare-fun res!88602 () Bool)

(assert (=> b!107521 (=> (not res!88602) (not e!70380))))

(declare-datatypes ((array!4927 0))(
  ( (array!4928 (arr!2836 (Array (_ BitVec 32) (_ BitVec 8))) (size!2243 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3960 0))(
  ( (BitStream!3961 (buf!2628 array!4927) (currentByte!5152 (_ BitVec 32)) (currentBit!5147 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3960)

(declare-fun lt!160951 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!107521 (= res!88602 (validate_offset_bits!1 ((_ sign_extend 32) (size!2243 (buf!2628 thiss!1305))) ((_ sign_extend 32) (currentByte!5152 thiss!1305)) ((_ sign_extend 32) (currentBit!5147 thiss!1305)) lt!160951))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!107521 (= lt!160951 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!107522 () Bool)

(declare-fun res!88609 () Bool)

(assert (=> b!107522 (=> (not res!88609) (not e!70380))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107522 (= res!88609 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!107523 () Bool)

(declare-fun res!88605 () Bool)

(declare-fun e!70374 () Bool)

(assert (=> b!107523 (=> (not res!88605) (not e!70374))))

(declare-datatypes ((Unit!6588 0))(
  ( (Unit!6589) )
))
(declare-datatypes ((tuple2!8856 0))(
  ( (tuple2!8857 (_1!4685 Unit!6588) (_2!4685 BitStream!3960)) )
))
(declare-fun lt!160950 () tuple2!8856)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!107523 (= res!88605 (invariant!0 (currentBit!5147 thiss!1305) (currentByte!5152 thiss!1305) (size!2243 (buf!2628 (_2!4685 lt!160950)))))))

(declare-fun b!107524 () Bool)

(declare-fun e!70377 () Bool)

(declare-datatypes ((tuple2!8858 0))(
  ( (tuple2!8859 (_1!4686 BitStream!3960) (_2!4686 Bool)) )
))
(declare-fun lt!160955 () tuple2!8858)

(declare-fun lt!160941 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107524 (= e!70377 (= (bitIndex!0 (size!2243 (buf!2628 (_1!4686 lt!160955))) (currentByte!5152 (_1!4686 lt!160955)) (currentBit!5147 (_1!4686 lt!160955))) lt!160941))))

(declare-fun b!107525 () Bool)

(declare-fun e!70381 () Bool)

(declare-fun lt!160948 () (_ BitVec 64))

(declare-fun lt!160936 () (_ BitVec 64))

(assert (=> b!107525 (= e!70381 (= lt!160948 (bvsub lt!160936 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!107526 () Bool)

(declare-fun res!88608 () Bool)

(assert (=> b!107526 (=> (not res!88608) (not e!70380))))

(assert (=> b!107526 (= res!88608 (bvslt i!615 nBits!396))))

(declare-fun res!88606 () Bool)

(assert (=> start!21354 (=> (not res!88606) (not e!70373))))

(assert (=> start!21354 (= res!88606 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21354 e!70373))

(assert (=> start!21354 true))

(declare-fun e!70376 () Bool)

(declare-fun inv!12 (BitStream!3960) Bool)

(assert (=> start!21354 (and (inv!12 thiss!1305) e!70376)))

(declare-fun b!107527 () Bool)

(declare-fun lt!160940 () tuple2!8856)

(assert (=> b!107527 (= e!70374 (invariant!0 (currentBit!5147 thiss!1305) (currentByte!5152 thiss!1305) (size!2243 (buf!2628 (_2!4685 lt!160940)))))))

(declare-fun b!107528 () Bool)

(declare-fun array_inv!2045 (array!4927) Bool)

(assert (=> b!107528 (= e!70376 (array_inv!2045 (buf!2628 thiss!1305)))))

(declare-fun b!107529 () Bool)

(declare-fun e!70383 () Bool)

(declare-datatypes ((tuple2!8860 0))(
  ( (tuple2!8861 (_1!4687 BitStream!3960) (_2!4687 BitStream!3960)) )
))
(declare-fun lt!160958 () tuple2!8860)

(declare-fun moveBitIndexPrecond!0 (BitStream!3960 (_ BitVec 64)) Bool)

(assert (=> b!107529 (= e!70383 (moveBitIndexPrecond!0 (_1!4687 lt!160958) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!107529 e!70381))

(declare-fun res!88604 () Bool)

(assert (=> b!107529 (=> (not res!88604) (not e!70381))))

(declare-fun lt!160959 () (_ BitVec 64))

(declare-fun lt!160947 () tuple2!8860)

(declare-fun withMovedBitIndex!0 (BitStream!3960 (_ BitVec 64)) BitStream!3960)

(assert (=> b!107529 (= res!88604 (= (_1!4687 lt!160947) (withMovedBitIndex!0 (_2!4687 lt!160947) (bvsub lt!160936 lt!160959))))))

(assert (=> b!107529 (= lt!160936 (bitIndex!0 (size!2243 (buf!2628 (_2!4685 lt!160950))) (currentByte!5152 (_2!4685 lt!160950)) (currentBit!5147 (_2!4685 lt!160950))))))

(assert (=> b!107529 (= (_1!4687 lt!160958) (withMovedBitIndex!0 (_2!4687 lt!160958) (bvsub lt!160948 lt!160959)))))

(assert (=> b!107529 (= lt!160959 (bitIndex!0 (size!2243 (buf!2628 (_2!4685 lt!160940))) (currentByte!5152 (_2!4685 lt!160940)) (currentBit!5147 (_2!4685 lt!160940))))))

(assert (=> b!107529 (= lt!160948 (bitIndex!0 (size!2243 (buf!2628 thiss!1305)) (currentByte!5152 thiss!1305) (currentBit!5147 thiss!1305)))))

(declare-datatypes ((tuple2!8862 0))(
  ( (tuple2!8863 (_1!4688 BitStream!3960) (_2!4688 (_ BitVec 64))) )
))
(declare-fun lt!160954 () tuple2!8862)

(declare-fun lt!160934 () tuple2!8862)

(assert (=> b!107529 (and (= (_2!4688 lt!160954) (_2!4688 lt!160934)) (= (_1!4688 lt!160954) (_1!4688 lt!160934)))))

(declare-fun lt!160944 () (_ BitVec 64))

(declare-fun lt!160945 () Unit!6588)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6588)

(assert (=> b!107529 (= lt!160945 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4687 lt!160958) nBits!396 i!615 lt!160944))))

(declare-fun lt!160946 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8862)

(assert (=> b!107529 (= lt!160934 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4687 lt!160958) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160946))))

(declare-fun b!107530 () Bool)

(declare-fun e!70378 () Bool)

(declare-fun e!70375 () Bool)

(assert (=> b!107530 (= e!70378 e!70375)))

(declare-fun res!88613 () Bool)

(assert (=> b!107530 (=> (not res!88613) (not e!70375))))

(declare-fun lt!160939 () (_ BitVec 64))

(assert (=> b!107530 (= res!88613 (= lt!160941 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!160939)))))

(assert (=> b!107530 (= lt!160941 (bitIndex!0 (size!2243 (buf!2628 (_2!4685 lt!160950))) (currentByte!5152 (_2!4685 lt!160950)) (currentBit!5147 (_2!4685 lt!160950))))))

(assert (=> b!107530 (= lt!160939 (bitIndex!0 (size!2243 (buf!2628 thiss!1305)) (currentByte!5152 thiss!1305) (currentBit!5147 thiss!1305)))))

(declare-fun b!107531 () Bool)

(assert (=> b!107531 (= e!70380 (not e!70383))))

(declare-fun res!88614 () Bool)

(assert (=> b!107531 (=> res!88614 e!70383)))

(assert (=> b!107531 (= res!88614 (not (= (_1!4688 (readNLeastSignificantBitsLoopPure!0 (_1!4687 lt!160947) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160946)) (_2!4687 lt!160947))))))

(declare-fun lt!160953 () (_ BitVec 64))

(assert (=> b!107531 (validate_offset_bits!1 ((_ sign_extend 32) (size!2243 (buf!2628 (_2!4685 lt!160940)))) ((_ sign_extend 32) (currentByte!5152 (_2!4685 lt!160950))) ((_ sign_extend 32) (currentBit!5147 (_2!4685 lt!160950))) lt!160953)))

(declare-fun lt!160957 () Unit!6588)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3960 array!4927 (_ BitVec 64)) Unit!6588)

(assert (=> b!107531 (= lt!160957 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4685 lt!160950) (buf!2628 (_2!4685 lt!160940)) lt!160953))))

(assert (=> b!107531 (= lt!160953 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!160933 () tuple2!8858)

(declare-fun lt!160938 () (_ BitVec 64))

(assert (=> b!107531 (= lt!160946 (bvor lt!160944 (ite (_2!4686 lt!160933) lt!160938 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107531 (= lt!160954 (readNLeastSignificantBitsLoopPure!0 (_1!4687 lt!160958) nBits!396 i!615 lt!160944))))

(assert (=> b!107531 (validate_offset_bits!1 ((_ sign_extend 32) (size!2243 (buf!2628 (_2!4685 lt!160940)))) ((_ sign_extend 32) (currentByte!5152 thiss!1305)) ((_ sign_extend 32) (currentBit!5147 thiss!1305)) lt!160951)))

(declare-fun lt!160956 () Unit!6588)

(assert (=> b!107531 (= lt!160956 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2628 (_2!4685 lt!160940)) lt!160951))))

(assert (=> b!107531 (= lt!160944 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!160952 () Bool)

(assert (=> b!107531 (= (_2!4686 lt!160933) lt!160952)))

(declare-fun readBitPure!0 (BitStream!3960) tuple2!8858)

(assert (=> b!107531 (= lt!160933 (readBitPure!0 (_1!4687 lt!160958)))))

(declare-fun reader!0 (BitStream!3960 BitStream!3960) tuple2!8860)

(assert (=> b!107531 (= lt!160947 (reader!0 (_2!4685 lt!160950) (_2!4685 lt!160940)))))

(assert (=> b!107531 (= lt!160958 (reader!0 thiss!1305 (_2!4685 lt!160940)))))

(declare-fun e!70382 () Bool)

(assert (=> b!107531 e!70382))

(declare-fun res!88607 () Bool)

(assert (=> b!107531 (=> (not res!88607) (not e!70382))))

(declare-fun lt!160937 () tuple2!8858)

(declare-fun lt!160942 () tuple2!8858)

(assert (=> b!107531 (= res!88607 (= (bitIndex!0 (size!2243 (buf!2628 (_1!4686 lt!160937))) (currentByte!5152 (_1!4686 lt!160937)) (currentBit!5147 (_1!4686 lt!160937))) (bitIndex!0 (size!2243 (buf!2628 (_1!4686 lt!160942))) (currentByte!5152 (_1!4686 lt!160942)) (currentBit!5147 (_1!4686 lt!160942)))))))

(declare-fun lt!160935 () Unit!6588)

(declare-fun lt!160943 () BitStream!3960)

(declare-fun readBitPrefixLemma!0 (BitStream!3960 BitStream!3960) Unit!6588)

(assert (=> b!107531 (= lt!160935 (readBitPrefixLemma!0 lt!160943 (_2!4685 lt!160940)))))

(assert (=> b!107531 (= lt!160942 (readBitPure!0 (BitStream!3961 (buf!2628 (_2!4685 lt!160940)) (currentByte!5152 thiss!1305) (currentBit!5147 thiss!1305))))))

(assert (=> b!107531 (= lt!160937 (readBitPure!0 lt!160943))))

(assert (=> b!107531 (= lt!160943 (BitStream!3961 (buf!2628 (_2!4685 lt!160950)) (currentByte!5152 thiss!1305) (currentBit!5147 thiss!1305)))))

(assert (=> b!107531 e!70374))

(declare-fun res!88611 () Bool)

(assert (=> b!107531 (=> (not res!88611) (not e!70374))))

(declare-fun isPrefixOf!0 (BitStream!3960 BitStream!3960) Bool)

(assert (=> b!107531 (= res!88611 (isPrefixOf!0 thiss!1305 (_2!4685 lt!160940)))))

(declare-fun lt!160949 () Unit!6588)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3960 BitStream!3960 BitStream!3960) Unit!6588)

(assert (=> b!107531 (= lt!160949 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4685 lt!160950) (_2!4685 lt!160940)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3960 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8856)

(assert (=> b!107531 (= lt!160940 (appendNLeastSignificantBitsLoop!0 (_2!4685 lt!160950) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!107531 e!70378))

(declare-fun res!88603 () Bool)

(assert (=> b!107531 (=> (not res!88603) (not e!70378))))

(assert (=> b!107531 (= res!88603 (= (size!2243 (buf!2628 thiss!1305)) (size!2243 (buf!2628 (_2!4685 lt!160950)))))))

(declare-fun appendBit!0 (BitStream!3960 Bool) tuple2!8856)

(assert (=> b!107531 (= lt!160950 (appendBit!0 thiss!1305 lt!160952))))

(assert (=> b!107531 (= lt!160952 (not (= (bvand v!199 lt!160938) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107531 (= lt!160938 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!107532 () Bool)

(declare-fun res!88612 () Bool)

(assert (=> b!107532 (=> (not res!88612) (not e!70375))))

(assert (=> b!107532 (= res!88612 (isPrefixOf!0 thiss!1305 (_2!4685 lt!160950)))))

(declare-fun b!107533 () Bool)

(assert (=> b!107533 (= e!70375 e!70377)))

(declare-fun res!88610 () Bool)

(assert (=> b!107533 (=> (not res!88610) (not e!70377))))

(assert (=> b!107533 (= res!88610 (and (= (_2!4686 lt!160955) lt!160952) (= (_1!4686 lt!160955) (_2!4685 lt!160950))))))

(declare-fun readerFrom!0 (BitStream!3960 (_ BitVec 32) (_ BitVec 32)) BitStream!3960)

(assert (=> b!107533 (= lt!160955 (readBitPure!0 (readerFrom!0 (_2!4685 lt!160950) (currentBit!5147 thiss!1305) (currentByte!5152 thiss!1305))))))

(declare-fun b!107534 () Bool)

(assert (=> b!107534 (= e!70382 (= (_2!4686 lt!160937) (_2!4686 lt!160942)))))

(assert (= (and start!21354 res!88606) b!107521))

(assert (= (and b!107521 res!88602) b!107522))

(assert (= (and b!107522 res!88609) b!107526))

(assert (= (and b!107526 res!88608) b!107531))

(assert (= (and b!107531 res!88603) b!107530))

(assert (= (and b!107530 res!88613) b!107532))

(assert (= (and b!107532 res!88612) b!107533))

(assert (= (and b!107533 res!88610) b!107524))

(assert (= (and b!107531 res!88611) b!107523))

(assert (= (and b!107523 res!88605) b!107527))

(assert (= (and b!107531 res!88607) b!107534))

(assert (= (and b!107531 (not res!88614)) b!107529))

(assert (= (and b!107529 res!88604) b!107525))

(assert (= start!21354 b!107528))

(declare-fun m!158929 () Bool)

(assert (=> b!107533 m!158929))

(assert (=> b!107533 m!158929))

(declare-fun m!158931 () Bool)

(assert (=> b!107533 m!158931))

(declare-fun m!158933 () Bool)

(assert (=> b!107530 m!158933))

(declare-fun m!158935 () Bool)

(assert (=> b!107530 m!158935))

(declare-fun m!158937 () Bool)

(assert (=> b!107532 m!158937))

(assert (=> b!107529 m!158935))

(declare-fun m!158939 () Bool)

(assert (=> b!107529 m!158939))

(declare-fun m!158941 () Bool)

(assert (=> b!107529 m!158941))

(assert (=> b!107529 m!158941))

(declare-fun m!158943 () Bool)

(assert (=> b!107529 m!158943))

(assert (=> b!107529 m!158933))

(declare-fun m!158945 () Bool)

(assert (=> b!107529 m!158945))

(declare-fun m!158947 () Bool)

(assert (=> b!107529 m!158947))

(declare-fun m!158949 () Bool)

(assert (=> b!107529 m!158949))

(declare-fun m!158951 () Bool)

(assert (=> b!107529 m!158951))

(declare-fun m!158953 () Bool)

(assert (=> b!107523 m!158953))

(declare-fun m!158955 () Bool)

(assert (=> b!107527 m!158955))

(declare-fun m!158957 () Bool)

(assert (=> b!107524 m!158957))

(declare-fun m!158959 () Bool)

(assert (=> b!107528 m!158959))

(declare-fun m!158961 () Bool)

(assert (=> start!21354 m!158961))

(declare-fun m!158963 () Bool)

(assert (=> b!107531 m!158963))

(declare-fun m!158965 () Bool)

(assert (=> b!107531 m!158965))

(declare-fun m!158967 () Bool)

(assert (=> b!107531 m!158967))

(declare-fun m!158969 () Bool)

(assert (=> b!107531 m!158969))

(declare-fun m!158971 () Bool)

(assert (=> b!107531 m!158971))

(declare-fun m!158973 () Bool)

(assert (=> b!107531 m!158973))

(declare-fun m!158975 () Bool)

(assert (=> b!107531 m!158975))

(declare-fun m!158977 () Bool)

(assert (=> b!107531 m!158977))

(declare-fun m!158979 () Bool)

(assert (=> b!107531 m!158979))

(declare-fun m!158981 () Bool)

(assert (=> b!107531 m!158981))

(declare-fun m!158983 () Bool)

(assert (=> b!107531 m!158983))

(declare-fun m!158985 () Bool)

(assert (=> b!107531 m!158985))

(declare-fun m!158987 () Bool)

(assert (=> b!107531 m!158987))

(declare-fun m!158989 () Bool)

(assert (=> b!107531 m!158989))

(declare-fun m!158991 () Bool)

(assert (=> b!107531 m!158991))

(declare-fun m!158993 () Bool)

(assert (=> b!107531 m!158993))

(declare-fun m!158995 () Bool)

(assert (=> b!107531 m!158995))

(declare-fun m!158997 () Bool)

(assert (=> b!107531 m!158997))

(declare-fun m!158999 () Bool)

(assert (=> b!107531 m!158999))

(declare-fun m!159001 () Bool)

(assert (=> b!107521 m!159001))

(declare-fun m!159003 () Bool)

(assert (=> b!107522 m!159003))

(check-sat (not b!107533) (not start!21354) (not b!107532) (not b!107527) (not b!107521) (not b!107531) (not b!107524) (not b!107529) (not b!107530) (not b!107528) (not b!107523) (not b!107522))
(check-sat)
(get-model)


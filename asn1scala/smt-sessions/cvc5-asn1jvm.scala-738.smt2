; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20596 () Bool)

(assert start!20596)

(declare-fun b!103981 () Bool)

(declare-fun e!68095 () Bool)

(declare-fun e!68091 () Bool)

(assert (=> b!103981 (= e!68095 e!68091)))

(declare-fun res!85590 () Bool)

(assert (=> b!103981 (=> (not res!85590) (not e!68091))))

(declare-fun lt!152307 () (_ BitVec 64))

(declare-fun lt!152295 () (_ BitVec 64))

(assert (=> b!103981 (= res!85590 (= lt!152307 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!152295)))))

(declare-datatypes ((array!4854 0))(
  ( (array!4855 (arr!2808 (Array (_ BitVec 32) (_ BitVec 8))) (size!2215 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3904 0))(
  ( (BitStream!3905 (buf!2581 array!4854) (currentByte!5066 (_ BitVec 32)) (currentBit!5061 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6374 0))(
  ( (Unit!6375) )
))
(declare-datatypes ((tuple2!8566 0))(
  ( (tuple2!8567 (_1!4538 Unit!6374) (_2!4538 BitStream!3904)) )
))
(declare-fun lt!152301 () tuple2!8566)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103981 (= lt!152307 (bitIndex!0 (size!2215 (buf!2581 (_2!4538 lt!152301))) (currentByte!5066 (_2!4538 lt!152301)) (currentBit!5061 (_2!4538 lt!152301))))))

(declare-fun thiss!1305 () BitStream!3904)

(assert (=> b!103981 (= lt!152295 (bitIndex!0 (size!2215 (buf!2581 thiss!1305)) (currentByte!5066 thiss!1305) (currentBit!5061 thiss!1305)))))

(declare-fun b!103982 () Bool)

(declare-fun e!68100 () Bool)

(assert (=> b!103982 (= e!68091 e!68100)))

(declare-fun res!85596 () Bool)

(assert (=> b!103982 (=> (not res!85596) (not e!68100))))

(declare-datatypes ((tuple2!8568 0))(
  ( (tuple2!8569 (_1!4539 BitStream!3904) (_2!4539 Bool)) )
))
(declare-fun lt!152302 () tuple2!8568)

(declare-fun lt!152292 () Bool)

(assert (=> b!103982 (= res!85596 (and (= (_2!4539 lt!152302) lt!152292) (= (_1!4539 lt!152302) (_2!4538 lt!152301))))))

(declare-fun readBitPure!0 (BitStream!3904) tuple2!8568)

(declare-fun readerFrom!0 (BitStream!3904 (_ BitVec 32) (_ BitVec 32)) BitStream!3904)

(assert (=> b!103982 (= lt!152302 (readBitPure!0 (readerFrom!0 (_2!4538 lt!152301) (currentBit!5061 thiss!1305) (currentByte!5066 thiss!1305))))))

(declare-fun b!103983 () Bool)

(declare-fun res!85598 () Bool)

(assert (=> b!103983 (=> (not res!85598) (not e!68091))))

(declare-fun isPrefixOf!0 (BitStream!3904 BitStream!3904) Bool)

(assert (=> b!103983 (= res!85598 (isPrefixOf!0 thiss!1305 (_2!4538 lt!152301)))))

(declare-fun b!103984 () Bool)

(declare-fun e!68093 () Bool)

(declare-fun lt!152303 () tuple2!8568)

(declare-fun lt!152304 () tuple2!8568)

(assert (=> b!103984 (= e!68093 (= (_2!4539 lt!152303) (_2!4539 lt!152304)))))

(declare-fun b!103985 () Bool)

(declare-fun e!68094 () Bool)

(assert (=> b!103985 (= e!68094 true)))

(declare-fun lt!152293 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-datatypes ((tuple2!8570 0))(
  ( (tuple2!8571 (_1!4540 BitStream!3904) (_2!4540 (_ BitVec 64))) )
))
(declare-fun lt!152313 () tuple2!8570)

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((tuple2!8572 0))(
  ( (tuple2!8573 (_1!4541 BitStream!3904) (_2!4541 BitStream!3904)) )
))
(declare-fun lt!152312 () tuple2!8572)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8570)

(declare-fun withMovedBitIndex!0 (BitStream!3904 (_ BitVec 64)) BitStream!3904)

(assert (=> b!103985 (= lt!152313 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4541 lt!152312) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152293))))

(declare-fun b!103986 () Bool)

(declare-fun e!68097 () Bool)

(declare-fun array_inv!2017 (array!4854) Bool)

(assert (=> b!103986 (= e!68097 (array_inv!2017 (buf!2581 thiss!1305)))))

(declare-fun b!103987 () Bool)

(declare-fun res!85593 () Bool)

(assert (=> b!103987 (=> res!85593 e!68094)))

(declare-fun lt!152310 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103987 (= res!85593 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2215 (buf!2581 (_1!4541 lt!152312)))) ((_ sign_extend 32) (currentByte!5066 (_1!4541 lt!152312))) ((_ sign_extend 32) (currentBit!5061 (_1!4541 lt!152312))) lt!152310)))))

(declare-fun b!103988 () Bool)

(declare-fun e!68099 () Bool)

(declare-fun lt!152296 () tuple2!8566)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103988 (= e!68099 (invariant!0 (currentBit!5061 thiss!1305) (currentByte!5066 thiss!1305) (size!2215 (buf!2581 (_2!4538 lt!152296)))))))

(declare-fun res!85592 () Bool)

(declare-fun e!68092 () Bool)

(assert (=> start!20596 (=> (not res!85592) (not e!68092))))

(assert (=> start!20596 (= res!85592 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20596 e!68092))

(assert (=> start!20596 true))

(declare-fun inv!12 (BitStream!3904) Bool)

(assert (=> start!20596 (and (inv!12 thiss!1305) e!68097)))

(declare-fun b!103989 () Bool)

(declare-fun e!68090 () Bool)

(assert (=> b!103989 (= e!68090 (not e!68094))))

(declare-fun res!85594 () Bool)

(assert (=> b!103989 (=> res!85594 e!68094)))

(declare-fun lt!152300 () tuple2!8572)

(assert (=> b!103989 (= res!85594 (not (= (_1!4540 (readNLeastSignificantBitsLoopPure!0 (_1!4541 lt!152300) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152293)) (_2!4541 lt!152300))))))

(declare-fun lt!152291 () (_ BitVec 64))

(assert (=> b!103989 (validate_offset_bits!1 ((_ sign_extend 32) (size!2215 (buf!2581 (_2!4538 lt!152296)))) ((_ sign_extend 32) (currentByte!5066 (_2!4538 lt!152301))) ((_ sign_extend 32) (currentBit!5061 (_2!4538 lt!152301))) lt!152291)))

(declare-fun lt!152297 () Unit!6374)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3904 array!4854 (_ BitVec 64)) Unit!6374)

(assert (=> b!103989 (= lt!152297 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4538 lt!152301) (buf!2581 (_2!4538 lt!152296)) lt!152291))))

(assert (=> b!103989 (= lt!152291 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!152314 () (_ BitVec 64))

(declare-fun lt!152294 () (_ BitVec 64))

(declare-fun lt!152290 () tuple2!8568)

(assert (=> b!103989 (= lt!152293 (bvor lt!152314 (ite (_2!4539 lt!152290) lt!152294 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!152299 () tuple2!8570)

(assert (=> b!103989 (= lt!152299 (readNLeastSignificantBitsLoopPure!0 (_1!4541 lt!152312) nBits!396 i!615 lt!152314))))

(assert (=> b!103989 (validate_offset_bits!1 ((_ sign_extend 32) (size!2215 (buf!2581 (_2!4538 lt!152296)))) ((_ sign_extend 32) (currentByte!5066 thiss!1305)) ((_ sign_extend 32) (currentBit!5061 thiss!1305)) lt!152310)))

(declare-fun lt!152308 () Unit!6374)

(assert (=> b!103989 (= lt!152308 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2581 (_2!4538 lt!152296)) lt!152310))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!152305 () (_ BitVec 64))

(assert (=> b!103989 (= lt!152314 (bvand v!199 (bvnot lt!152305)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103989 (= lt!152305 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!103989 (= (_2!4539 lt!152290) lt!152292)))

(assert (=> b!103989 (= lt!152290 (readBitPure!0 (_1!4541 lt!152312)))))

(declare-fun reader!0 (BitStream!3904 BitStream!3904) tuple2!8572)

(assert (=> b!103989 (= lt!152300 (reader!0 (_2!4538 lt!152301) (_2!4538 lt!152296)))))

(assert (=> b!103989 (= lt!152312 (reader!0 thiss!1305 (_2!4538 lt!152296)))))

(assert (=> b!103989 e!68093))

(declare-fun res!85595 () Bool)

(assert (=> b!103989 (=> (not res!85595) (not e!68093))))

(assert (=> b!103989 (= res!85595 (= (bitIndex!0 (size!2215 (buf!2581 (_1!4539 lt!152303))) (currentByte!5066 (_1!4539 lt!152303)) (currentBit!5061 (_1!4539 lt!152303))) (bitIndex!0 (size!2215 (buf!2581 (_1!4539 lt!152304))) (currentByte!5066 (_1!4539 lt!152304)) (currentBit!5061 (_1!4539 lt!152304)))))))

(declare-fun lt!152298 () Unit!6374)

(declare-fun lt!152311 () BitStream!3904)

(declare-fun readBitPrefixLemma!0 (BitStream!3904 BitStream!3904) Unit!6374)

(assert (=> b!103989 (= lt!152298 (readBitPrefixLemma!0 lt!152311 (_2!4538 lt!152296)))))

(assert (=> b!103989 (= lt!152304 (readBitPure!0 (BitStream!3905 (buf!2581 (_2!4538 lt!152296)) (currentByte!5066 thiss!1305) (currentBit!5061 thiss!1305))))))

(assert (=> b!103989 (= lt!152303 (readBitPure!0 lt!152311))))

(assert (=> b!103989 (= lt!152311 (BitStream!3905 (buf!2581 (_2!4538 lt!152301)) (currentByte!5066 thiss!1305) (currentBit!5061 thiss!1305)))))

(assert (=> b!103989 e!68099))

(declare-fun res!85587 () Bool)

(assert (=> b!103989 (=> (not res!85587) (not e!68099))))

(assert (=> b!103989 (= res!85587 (isPrefixOf!0 thiss!1305 (_2!4538 lt!152296)))))

(declare-fun lt!152309 () Unit!6374)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3904 BitStream!3904 BitStream!3904) Unit!6374)

(assert (=> b!103989 (= lt!152309 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4538 lt!152301) (_2!4538 lt!152296)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3904 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8566)

(assert (=> b!103989 (= lt!152296 (appendNLeastSignificantBitsLoop!0 (_2!4538 lt!152301) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!103989 e!68095))

(declare-fun res!85591 () Bool)

(assert (=> b!103989 (=> (not res!85591) (not e!68095))))

(assert (=> b!103989 (= res!85591 (= (size!2215 (buf!2581 thiss!1305)) (size!2215 (buf!2581 (_2!4538 lt!152301)))))))

(declare-fun appendBit!0 (BitStream!3904 Bool) tuple2!8566)

(assert (=> b!103989 (= lt!152301 (appendBit!0 thiss!1305 lt!152292))))

(assert (=> b!103989 (= lt!152292 (not (= (bvand v!199 lt!152294) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103989 (= lt!152294 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!103990 () Bool)

(declare-fun res!85589 () Bool)

(assert (=> b!103990 (=> (not res!85589) (not e!68099))))

(assert (=> b!103990 (= res!85589 (invariant!0 (currentBit!5061 thiss!1305) (currentByte!5066 thiss!1305) (size!2215 (buf!2581 (_2!4538 lt!152301)))))))

(declare-fun b!103991 () Bool)

(declare-fun e!68096 () Bool)

(assert (=> b!103991 (= e!68096 e!68090)))

(declare-fun res!85597 () Bool)

(assert (=> b!103991 (=> (not res!85597) (not e!68090))))

(declare-fun lt!152306 () (_ BitVec 64))

(assert (=> b!103991 (= res!85597 (and (= (bvand v!199 lt!152306) v!199) (bvslt i!615 nBits!396)))))

(assert (=> b!103991 (= lt!152306 (onesLSBLong!0 nBits!396))))

(declare-fun b!103992 () Bool)

(assert (=> b!103992 (= e!68100 (= (bitIndex!0 (size!2215 (buf!2581 (_1!4539 lt!152302))) (currentByte!5066 (_1!4539 lt!152302)) (currentBit!5061 (_1!4539 lt!152302))) lt!152307))))

(declare-fun b!103993 () Bool)

(assert (=> b!103993 (= e!68092 e!68096)))

(declare-fun res!85586 () Bool)

(assert (=> b!103993 (=> (not res!85586) (not e!68096))))

(assert (=> b!103993 (= res!85586 (validate_offset_bits!1 ((_ sign_extend 32) (size!2215 (buf!2581 thiss!1305))) ((_ sign_extend 32) (currentByte!5066 thiss!1305)) ((_ sign_extend 32) (currentBit!5061 thiss!1305)) lt!152310))))

(assert (=> b!103993 (= lt!152310 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!103994 () Bool)

(declare-fun res!85588 () Bool)

(assert (=> b!103994 (=> res!85588 e!68094)))

(assert (=> b!103994 (= res!85588 (or (not (= (bvand lt!152314 lt!152305) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!152314 lt!152306) lt!152314))))))

(assert (= (and start!20596 res!85592) b!103993))

(assert (= (and b!103993 res!85586) b!103991))

(assert (= (and b!103991 res!85597) b!103989))

(assert (= (and b!103989 res!85591) b!103981))

(assert (= (and b!103981 res!85590) b!103983))

(assert (= (and b!103983 res!85598) b!103982))

(assert (= (and b!103982 res!85596) b!103992))

(assert (= (and b!103989 res!85587) b!103990))

(assert (= (and b!103990 res!85589) b!103988))

(assert (= (and b!103989 res!85595) b!103984))

(assert (= (and b!103989 (not res!85594)) b!103987))

(assert (= (and b!103987 (not res!85593)) b!103994))

(assert (= (and b!103994 (not res!85588)) b!103985))

(assert (= start!20596 b!103986))

(declare-fun m!151909 () Bool)

(assert (=> b!103982 m!151909))

(assert (=> b!103982 m!151909))

(declare-fun m!151911 () Bool)

(assert (=> b!103982 m!151911))

(declare-fun m!151913 () Bool)

(assert (=> start!20596 m!151913))

(declare-fun m!151915 () Bool)

(assert (=> b!103991 m!151915))

(declare-fun m!151917 () Bool)

(assert (=> b!103986 m!151917))

(declare-fun m!151919 () Bool)

(assert (=> b!103989 m!151919))

(declare-fun m!151921 () Bool)

(assert (=> b!103989 m!151921))

(declare-fun m!151923 () Bool)

(assert (=> b!103989 m!151923))

(declare-fun m!151925 () Bool)

(assert (=> b!103989 m!151925))

(declare-fun m!151927 () Bool)

(assert (=> b!103989 m!151927))

(declare-fun m!151929 () Bool)

(assert (=> b!103989 m!151929))

(declare-fun m!151931 () Bool)

(assert (=> b!103989 m!151931))

(declare-fun m!151933 () Bool)

(assert (=> b!103989 m!151933))

(declare-fun m!151935 () Bool)

(assert (=> b!103989 m!151935))

(declare-fun m!151937 () Bool)

(assert (=> b!103989 m!151937))

(declare-fun m!151939 () Bool)

(assert (=> b!103989 m!151939))

(declare-fun m!151941 () Bool)

(assert (=> b!103989 m!151941))

(declare-fun m!151943 () Bool)

(assert (=> b!103989 m!151943))

(declare-fun m!151945 () Bool)

(assert (=> b!103989 m!151945))

(declare-fun m!151947 () Bool)

(assert (=> b!103989 m!151947))

(declare-fun m!151949 () Bool)

(assert (=> b!103989 m!151949))

(declare-fun m!151951 () Bool)

(assert (=> b!103989 m!151951))

(declare-fun m!151953 () Bool)

(assert (=> b!103989 m!151953))

(declare-fun m!151955 () Bool)

(assert (=> b!103989 m!151955))

(declare-fun m!151957 () Bool)

(assert (=> b!103985 m!151957))

(assert (=> b!103985 m!151957))

(declare-fun m!151959 () Bool)

(assert (=> b!103985 m!151959))

(declare-fun m!151961 () Bool)

(assert (=> b!103993 m!151961))

(declare-fun m!151963 () Bool)

(assert (=> b!103988 m!151963))

(declare-fun m!151965 () Bool)

(assert (=> b!103987 m!151965))

(declare-fun m!151967 () Bool)

(assert (=> b!103983 m!151967))

(declare-fun m!151969 () Bool)

(assert (=> b!103981 m!151969))

(declare-fun m!151971 () Bool)

(assert (=> b!103981 m!151971))

(declare-fun m!151973 () Bool)

(assert (=> b!103990 m!151973))

(declare-fun m!151975 () Bool)

(assert (=> b!103992 m!151975))

(push 1)

(assert (not b!103983))

(assert (not start!20596))

(assert (not b!103986))

(assert (not b!103982))

(assert (not b!103992))

(assert (not b!103993))

(assert (not b!103991))


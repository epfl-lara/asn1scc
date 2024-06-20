; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21596 () Bool)

(assert start!21596)

(declare-fun b!108750 () Bool)

(declare-fun e!71197 () Bool)

(declare-datatypes ((array!4959 0))(
  ( (array!4960 (arr!2849 (Array (_ BitVec 32) (_ BitVec 8))) (size!2256 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3986 0))(
  ( (BitStream!3987 (buf!2647 array!4959) (currentByte!5183 (_ BitVec 32)) (currentBit!5178 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3986)

(declare-fun array_inv!2058 (array!4959) Bool)

(assert (=> b!108750 (= e!71197 (array_inv!2058 (buf!2647 thiss!1305)))))

(declare-fun b!108751 () Bool)

(declare-fun e!71193 () Bool)

(declare-datatypes ((Unit!6653 0))(
  ( (Unit!6654) )
))
(declare-datatypes ((tuple2!8980 0))(
  ( (tuple2!8981 (_1!4747 Unit!6653) (_2!4747 BitStream!3986)) )
))
(declare-fun lt!164047 () tuple2!8980)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108751 (= e!71193 (invariant!0 (currentBit!5178 thiss!1305) (currentByte!5183 thiss!1305) (size!2256 (buf!2647 (_2!4747 lt!164047)))))))

(declare-fun b!108752 () Bool)

(declare-fun e!71199 () Bool)

(declare-fun e!71198 () Bool)

(assert (=> b!108752 (= e!71199 e!71198)))

(declare-fun res!89680 () Bool)

(assert (=> b!108752 (=> (not res!89680) (not e!71198))))

(declare-datatypes ((tuple2!8982 0))(
  ( (tuple2!8983 (_1!4748 BitStream!3986) (_2!4748 Bool)) )
))
(declare-fun lt!164050 () tuple2!8982)

(declare-fun lt!164043 () tuple2!8980)

(declare-fun lt!164058 () Bool)

(assert (=> b!108752 (= res!89680 (and (= (_2!4748 lt!164050) lt!164058) (= (_1!4748 lt!164050) (_2!4747 lt!164043))))))

(declare-fun readBitPure!0 (BitStream!3986) tuple2!8982)

(declare-fun readerFrom!0 (BitStream!3986 (_ BitVec 32) (_ BitVec 32)) BitStream!3986)

(assert (=> b!108752 (= lt!164050 (readBitPure!0 (readerFrom!0 (_2!4747 lt!164043) (currentBit!5178 thiss!1305) (currentByte!5183 thiss!1305))))))

(declare-fun b!108753 () Bool)

(declare-fun lt!164063 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108753 (= e!71198 (= (bitIndex!0 (size!2256 (buf!2647 (_1!4748 lt!164050))) (currentByte!5183 (_1!4748 lt!164050)) (currentBit!5178 (_1!4748 lt!164050))) lt!164063))))

(declare-fun b!108754 () Bool)

(declare-fun e!71191 () Bool)

(declare-fun lt!164036 () tuple2!8982)

(declare-fun lt!164044 () tuple2!8982)

(assert (=> b!108754 (= e!71191 (= (_2!4748 lt!164036) (_2!4748 lt!164044)))))

(declare-fun b!108755 () Bool)

(declare-fun res!89674 () Bool)

(declare-fun e!71196 () Bool)

(assert (=> b!108755 (=> (not res!89674) (not e!71196))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!108755 (= res!89674 (bvslt i!615 nBits!396))))

(declare-fun b!108756 () Bool)

(declare-fun res!89677 () Bool)

(assert (=> b!108756 (=> (not res!89677) (not e!71196))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108756 (= res!89677 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!108757 () Bool)

(declare-fun e!71200 () Bool)

(assert (=> b!108757 (= e!71196 (not e!71200))))

(declare-fun res!89676 () Bool)

(assert (=> b!108757 (=> res!89676 e!71200)))

(declare-datatypes ((tuple2!8984 0))(
  ( (tuple2!8985 (_1!4749 BitStream!3986) (_2!4749 (_ BitVec 64))) )
))
(declare-fun lt!164045 () tuple2!8984)

(declare-datatypes ((tuple2!8986 0))(
  ( (tuple2!8987 (_1!4750 BitStream!3986) (_2!4750 BitStream!3986)) )
))
(declare-fun lt!164041 () tuple2!8986)

(assert (=> b!108757 (= res!89676 (not (= (_1!4749 lt!164045) (_2!4750 lt!164041))))))

(declare-fun lt!164057 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3986 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8984)

(assert (=> b!108757 (= lt!164045 (readNLeastSignificantBitsLoopPure!0 (_1!4750 lt!164041) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164057))))

(declare-fun lt!164052 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108757 (validate_offset_bits!1 ((_ sign_extend 32) (size!2256 (buf!2647 (_2!4747 lt!164047)))) ((_ sign_extend 32) (currentByte!5183 (_2!4747 lt!164043))) ((_ sign_extend 32) (currentBit!5178 (_2!4747 lt!164043))) lt!164052)))

(declare-fun lt!164035 () Unit!6653)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3986 array!4959 (_ BitVec 64)) Unit!6653)

(assert (=> b!108757 (= lt!164035 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4747 lt!164043) (buf!2647 (_2!4747 lt!164047)) lt!164052))))

(assert (=> b!108757 (= lt!164052 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!164062 () (_ BitVec 64))

(declare-fun lt!164037 () tuple2!8982)

(declare-fun lt!164040 () (_ BitVec 64))

(assert (=> b!108757 (= lt!164057 (bvor lt!164040 (ite (_2!4748 lt!164037) lt!164062 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!164049 () tuple2!8986)

(declare-fun lt!164039 () tuple2!8984)

(assert (=> b!108757 (= lt!164039 (readNLeastSignificantBitsLoopPure!0 (_1!4750 lt!164049) nBits!396 i!615 lt!164040))))

(declare-fun lt!164053 () (_ BitVec 64))

(assert (=> b!108757 (validate_offset_bits!1 ((_ sign_extend 32) (size!2256 (buf!2647 (_2!4747 lt!164047)))) ((_ sign_extend 32) (currentByte!5183 thiss!1305)) ((_ sign_extend 32) (currentBit!5178 thiss!1305)) lt!164053)))

(declare-fun lt!164059 () Unit!6653)

(assert (=> b!108757 (= lt!164059 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2647 (_2!4747 lt!164047)) lt!164053))))

(assert (=> b!108757 (= lt!164040 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!108757 (= (_2!4748 lt!164037) lt!164058)))

(assert (=> b!108757 (= lt!164037 (readBitPure!0 (_1!4750 lt!164049)))))

(declare-fun reader!0 (BitStream!3986 BitStream!3986) tuple2!8986)

(assert (=> b!108757 (= lt!164041 (reader!0 (_2!4747 lt!164043) (_2!4747 lt!164047)))))

(assert (=> b!108757 (= lt!164049 (reader!0 thiss!1305 (_2!4747 lt!164047)))))

(assert (=> b!108757 e!71191))

(declare-fun res!89671 () Bool)

(assert (=> b!108757 (=> (not res!89671) (not e!71191))))

(assert (=> b!108757 (= res!89671 (= (bitIndex!0 (size!2256 (buf!2647 (_1!4748 lt!164036))) (currentByte!5183 (_1!4748 lt!164036)) (currentBit!5178 (_1!4748 lt!164036))) (bitIndex!0 (size!2256 (buf!2647 (_1!4748 lt!164044))) (currentByte!5183 (_1!4748 lt!164044)) (currentBit!5178 (_1!4748 lt!164044)))))))

(declare-fun lt!164046 () Unit!6653)

(declare-fun lt!164038 () BitStream!3986)

(declare-fun readBitPrefixLemma!0 (BitStream!3986 BitStream!3986) Unit!6653)

(assert (=> b!108757 (= lt!164046 (readBitPrefixLemma!0 lt!164038 (_2!4747 lt!164047)))))

(assert (=> b!108757 (= lt!164044 (readBitPure!0 (BitStream!3987 (buf!2647 (_2!4747 lt!164047)) (currentByte!5183 thiss!1305) (currentBit!5178 thiss!1305))))))

(assert (=> b!108757 (= lt!164036 (readBitPure!0 lt!164038))))

(assert (=> b!108757 (= lt!164038 (BitStream!3987 (buf!2647 (_2!4747 lt!164043)) (currentByte!5183 thiss!1305) (currentBit!5178 thiss!1305)))))

(assert (=> b!108757 e!71193))

(declare-fun res!89670 () Bool)

(assert (=> b!108757 (=> (not res!89670) (not e!71193))))

(declare-fun isPrefixOf!0 (BitStream!3986 BitStream!3986) Bool)

(assert (=> b!108757 (= res!89670 (isPrefixOf!0 thiss!1305 (_2!4747 lt!164047)))))

(declare-fun lt!164042 () Unit!6653)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3986 BitStream!3986 BitStream!3986) Unit!6653)

(assert (=> b!108757 (= lt!164042 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4747 lt!164043) (_2!4747 lt!164047)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3986 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8980)

(assert (=> b!108757 (= lt!164047 (appendNLeastSignificantBitsLoop!0 (_2!4747 lt!164043) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!71195 () Bool)

(assert (=> b!108757 e!71195))

(declare-fun res!89678 () Bool)

(assert (=> b!108757 (=> (not res!89678) (not e!71195))))

(assert (=> b!108757 (= res!89678 (= (size!2256 (buf!2647 thiss!1305)) (size!2256 (buf!2647 (_2!4747 lt!164043)))))))

(declare-fun appendBit!0 (BitStream!3986 Bool) tuple2!8980)

(assert (=> b!108757 (= lt!164043 (appendBit!0 thiss!1305 lt!164058))))

(assert (=> b!108757 (= lt!164058 (not (= (bvand v!199 lt!164062) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108757 (= lt!164062 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!108758 () Bool)

(declare-fun res!89668 () Bool)

(assert (=> b!108758 (=> (not res!89668) (not e!71193))))

(assert (=> b!108758 (= res!89668 (invariant!0 (currentBit!5178 thiss!1305) (currentByte!5183 thiss!1305) (size!2256 (buf!2647 (_2!4747 lt!164043)))))))

(declare-fun res!89679 () Bool)

(declare-fun e!71201 () Bool)

(assert (=> start!21596 (=> (not res!89679) (not e!71201))))

(assert (=> start!21596 (= res!89679 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21596 e!71201))

(assert (=> start!21596 true))

(declare-fun inv!12 (BitStream!3986) Bool)

(assert (=> start!21596 (and (inv!12 thiss!1305) e!71197)))

(declare-fun lt!164061 () (_ BitVec 64))

(declare-fun lt!164054 () (_ BitVec 64))

(declare-fun b!108759 () Bool)

(declare-fun lt!164056 () BitStream!3986)

(assert (=> b!108759 (= e!71200 (or (not (= (_1!4750 lt!164041) lt!164056)) (not (= (size!2256 (buf!2647 thiss!1305)) (size!2256 (buf!2647 (_2!4747 lt!164047))))) (not (= lt!164061 (bvadd lt!164054 lt!164053))) (bvsle (bvsub nBits!396 i!615) #b00000000000000000000000001000000)))))

(declare-fun e!71194 () Bool)

(assert (=> b!108759 e!71194))

(declare-fun res!89669 () Bool)

(assert (=> b!108759 (=> (not res!89669) (not e!71194))))

(declare-fun lt!164051 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3986 (_ BitVec 64)) BitStream!3986)

(assert (=> b!108759 (= res!89669 (= (_1!4750 lt!164041) (withMovedBitIndex!0 (_2!4750 lt!164041) (bvsub lt!164051 lt!164061))))))

(assert (=> b!108759 (= lt!164051 (bitIndex!0 (size!2256 (buf!2647 (_2!4747 lt!164043))) (currentByte!5183 (_2!4747 lt!164043)) (currentBit!5178 (_2!4747 lt!164043))))))

(assert (=> b!108759 (= (_1!4750 lt!164049) (withMovedBitIndex!0 (_2!4750 lt!164049) (bvsub lt!164054 lt!164061)))))

(assert (=> b!108759 (= lt!164061 (bitIndex!0 (size!2256 (buf!2647 (_2!4747 lt!164047))) (currentByte!5183 (_2!4747 lt!164047)) (currentBit!5178 (_2!4747 lt!164047))))))

(assert (=> b!108759 (= lt!164054 (bitIndex!0 (size!2256 (buf!2647 thiss!1305)) (currentByte!5183 thiss!1305) (currentBit!5178 thiss!1305)))))

(declare-fun lt!164060 () tuple2!8984)

(assert (=> b!108759 (and (= (_2!4749 lt!164039) (_2!4749 lt!164060)) (= (_1!4749 lt!164039) (_1!4749 lt!164060)))))

(declare-fun lt!164048 () Unit!6653)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3986 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6653)

(assert (=> b!108759 (= lt!164048 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4750 lt!164049) nBits!396 i!615 lt!164040))))

(assert (=> b!108759 (= lt!164060 (readNLeastSignificantBitsLoopPure!0 lt!164056 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164057))))

(assert (=> b!108759 (= lt!164056 (withMovedBitIndex!0 (_1!4750 lt!164049) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!108760 () Bool)

(assert (=> b!108760 (= e!71201 e!71196)))

(declare-fun res!89675 () Bool)

(assert (=> b!108760 (=> (not res!89675) (not e!71196))))

(assert (=> b!108760 (= res!89675 (validate_offset_bits!1 ((_ sign_extend 32) (size!2256 (buf!2647 thiss!1305))) ((_ sign_extend 32) (currentByte!5183 thiss!1305)) ((_ sign_extend 32) (currentBit!5178 thiss!1305)) lt!164053))))

(assert (=> b!108760 (= lt!164053 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!108761 () Bool)

(declare-fun res!89673 () Bool)

(assert (=> b!108761 (=> (not res!89673) (not e!71199))))

(assert (=> b!108761 (= res!89673 (isPrefixOf!0 thiss!1305 (_2!4747 lt!164043)))))

(declare-fun b!108762 () Bool)

(assert (=> b!108762 (= e!71194 (and (= lt!164054 (bvsub lt!164051 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4750 lt!164041) lt!164056)) (and (= (_2!4749 lt!164039) (_2!4749 lt!164045)) (= (_1!4749 lt!164039) (_2!4750 lt!164049))))))))

(declare-fun b!108763 () Bool)

(assert (=> b!108763 (= e!71195 e!71199)))

(declare-fun res!89672 () Bool)

(assert (=> b!108763 (=> (not res!89672) (not e!71199))))

(declare-fun lt!164055 () (_ BitVec 64))

(assert (=> b!108763 (= res!89672 (= lt!164063 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!164055)))))

(assert (=> b!108763 (= lt!164063 (bitIndex!0 (size!2256 (buf!2647 (_2!4747 lt!164043))) (currentByte!5183 (_2!4747 lt!164043)) (currentBit!5178 (_2!4747 lt!164043))))))

(assert (=> b!108763 (= lt!164055 (bitIndex!0 (size!2256 (buf!2647 thiss!1305)) (currentByte!5183 thiss!1305) (currentBit!5178 thiss!1305)))))

(assert (= (and start!21596 res!89679) b!108760))

(assert (= (and b!108760 res!89675) b!108756))

(assert (= (and b!108756 res!89677) b!108755))

(assert (= (and b!108755 res!89674) b!108757))

(assert (= (and b!108757 res!89678) b!108763))

(assert (= (and b!108763 res!89672) b!108761))

(assert (= (and b!108761 res!89673) b!108752))

(assert (= (and b!108752 res!89680) b!108753))

(assert (= (and b!108757 res!89670) b!108758))

(assert (= (and b!108758 res!89668) b!108751))

(assert (= (and b!108757 res!89671) b!108754))

(assert (= (and b!108757 (not res!89676)) b!108759))

(assert (= (and b!108759 res!89669) b!108762))

(assert (= start!21596 b!108750))

(declare-fun m!161247 () Bool)

(assert (=> b!108760 m!161247))

(declare-fun m!161249 () Bool)

(assert (=> b!108752 m!161249))

(assert (=> b!108752 m!161249))

(declare-fun m!161251 () Bool)

(assert (=> b!108752 m!161251))

(declare-fun m!161253 () Bool)

(assert (=> b!108761 m!161253))

(declare-fun m!161255 () Bool)

(assert (=> b!108758 m!161255))

(declare-fun m!161257 () Bool)

(assert (=> b!108757 m!161257))

(declare-fun m!161259 () Bool)

(assert (=> b!108757 m!161259))

(declare-fun m!161261 () Bool)

(assert (=> b!108757 m!161261))

(declare-fun m!161263 () Bool)

(assert (=> b!108757 m!161263))

(declare-fun m!161265 () Bool)

(assert (=> b!108757 m!161265))

(declare-fun m!161267 () Bool)

(assert (=> b!108757 m!161267))

(declare-fun m!161269 () Bool)

(assert (=> b!108757 m!161269))

(declare-fun m!161271 () Bool)

(assert (=> b!108757 m!161271))

(declare-fun m!161273 () Bool)

(assert (=> b!108757 m!161273))

(declare-fun m!161275 () Bool)

(assert (=> b!108757 m!161275))

(declare-fun m!161277 () Bool)

(assert (=> b!108757 m!161277))

(declare-fun m!161279 () Bool)

(assert (=> b!108757 m!161279))

(declare-fun m!161281 () Bool)

(assert (=> b!108757 m!161281))

(declare-fun m!161283 () Bool)

(assert (=> b!108757 m!161283))

(declare-fun m!161285 () Bool)

(assert (=> b!108757 m!161285))

(declare-fun m!161287 () Bool)

(assert (=> b!108757 m!161287))

(declare-fun m!161289 () Bool)

(assert (=> b!108757 m!161289))

(declare-fun m!161291 () Bool)

(assert (=> b!108757 m!161291))

(declare-fun m!161293 () Bool)

(assert (=> b!108757 m!161293))

(declare-fun m!161295 () Bool)

(assert (=> b!108763 m!161295))

(declare-fun m!161297 () Bool)

(assert (=> b!108763 m!161297))

(declare-fun m!161299 () Bool)

(assert (=> b!108759 m!161299))

(declare-fun m!161301 () Bool)

(assert (=> b!108759 m!161301))

(assert (=> b!108759 m!161297))

(declare-fun m!161303 () Bool)

(assert (=> b!108759 m!161303))

(declare-fun m!161305 () Bool)

(assert (=> b!108759 m!161305))

(assert (=> b!108759 m!161295))

(declare-fun m!161307 () Bool)

(assert (=> b!108759 m!161307))

(declare-fun m!161309 () Bool)

(assert (=> b!108759 m!161309))

(declare-fun m!161311 () Bool)

(assert (=> start!21596 m!161311))

(declare-fun m!161313 () Bool)

(assert (=> b!108753 m!161313))

(declare-fun m!161315 () Bool)

(assert (=> b!108756 m!161315))

(declare-fun m!161317 () Bool)

(assert (=> b!108750 m!161317))

(declare-fun m!161319 () Bool)

(assert (=> b!108751 m!161319))

(push 1)

(assert (not b!108750))

(assert (not b!108759))

(assert (not b!108761))

(assert (not b!108753))

(assert (not b!108758))

(assert (not b!108752))

(assert (not b!108763))

(assert (not b!108757))

(assert (not start!21596))

(assert (not b!108760))

(assert (not b!108751))

(assert (not b!108756))

(check-sat)

(pop 1)

(push 1)

(check-sat)


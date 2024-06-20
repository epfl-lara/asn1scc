; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20348 () Bool)

(assert start!20348)

(declare-fun b!102246 () Bool)

(declare-fun res!84060 () Bool)

(declare-fun e!66886 () Bool)

(assert (=> b!102246 (=> (not res!84060) (not e!66886))))

(declare-datatypes ((array!4792 0))(
  ( (array!4793 (arr!2780 (Array (_ BitVec 32) (_ BitVec 8))) (size!2187 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3848 0))(
  ( (BitStream!3849 (buf!2547 array!4792) (currentByte!5020 (_ BitVec 32)) (currentBit!5015 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3848)

(declare-datatypes ((Unit!6270 0))(
  ( (Unit!6271) )
))
(declare-datatypes ((tuple2!8318 0))(
  ( (tuple2!8319 (_1!4414 Unit!6270) (_2!4414 BitStream!3848)) )
))
(declare-fun lt!148749 () tuple2!8318)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102246 (= res!84060 (invariant!0 (currentBit!5015 thiss!1305) (currentByte!5020 thiss!1305) (size!2187 (buf!2547 (_2!4414 lt!148749)))))))

(declare-fun b!102247 () Bool)

(declare-fun e!66888 () Bool)

(assert (=> b!102247 (= e!66888 (not true))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!8320 0))(
  ( (tuple2!8321 (_1!4415 BitStream!3848) (_2!4415 BitStream!3848)) )
))
(declare-fun lt!148741 () tuple2!8320)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((tuple2!8322 0))(
  ( (tuple2!8323 (_1!4416 BitStream!3848) (_2!4416 (_ BitVec 64))) )
))
(declare-fun lt!148752 () tuple2!8322)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8322)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102247 (= lt!148752 (readNLeastSignificantBitsLoopPure!0 (_1!4415 lt!148741) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!148750 () tuple2!8318)

(declare-fun lt!148754 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102247 (validate_offset_bits!1 ((_ sign_extend 32) (size!2187 (buf!2547 (_2!4414 lt!148750)))) ((_ sign_extend 32) (currentByte!5020 thiss!1305)) ((_ sign_extend 32) (currentBit!5015 thiss!1305)) lt!148754)))

(declare-fun lt!148756 () Unit!6270)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3848 array!4792 (_ BitVec 64)) Unit!6270)

(assert (=> b!102247 (= lt!148756 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2547 (_2!4414 lt!148750)) lt!148754))))

(declare-fun lt!148743 () Bool)

(declare-datatypes ((tuple2!8324 0))(
  ( (tuple2!8325 (_1!4417 BitStream!3848) (_2!4417 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3848) tuple2!8324)

(assert (=> b!102247 (= (_2!4417 (readBitPure!0 (_1!4415 lt!148741))) lt!148743)))

(declare-fun lt!148751 () tuple2!8320)

(declare-fun reader!0 (BitStream!3848 BitStream!3848) tuple2!8320)

(assert (=> b!102247 (= lt!148751 (reader!0 (_2!4414 lt!148749) (_2!4414 lt!148750)))))

(assert (=> b!102247 (= lt!148741 (reader!0 thiss!1305 (_2!4414 lt!148750)))))

(declare-fun e!66891 () Bool)

(assert (=> b!102247 e!66891))

(declare-fun res!84055 () Bool)

(assert (=> b!102247 (=> (not res!84055) (not e!66891))))

(declare-fun lt!148746 () tuple2!8324)

(declare-fun lt!148742 () tuple2!8324)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102247 (= res!84055 (= (bitIndex!0 (size!2187 (buf!2547 (_1!4417 lt!148746))) (currentByte!5020 (_1!4417 lt!148746)) (currentBit!5015 (_1!4417 lt!148746))) (bitIndex!0 (size!2187 (buf!2547 (_1!4417 lt!148742))) (currentByte!5020 (_1!4417 lt!148742)) (currentBit!5015 (_1!4417 lt!148742)))))))

(declare-fun lt!148747 () Unit!6270)

(declare-fun lt!148745 () BitStream!3848)

(declare-fun readBitPrefixLemma!0 (BitStream!3848 BitStream!3848) Unit!6270)

(assert (=> b!102247 (= lt!148747 (readBitPrefixLemma!0 lt!148745 (_2!4414 lt!148750)))))

(assert (=> b!102247 (= lt!148742 (readBitPure!0 (BitStream!3849 (buf!2547 (_2!4414 lt!148750)) (currentByte!5020 thiss!1305) (currentBit!5015 thiss!1305))))))

(assert (=> b!102247 (= lt!148746 (readBitPure!0 lt!148745))))

(assert (=> b!102247 (= lt!148745 (BitStream!3849 (buf!2547 (_2!4414 lt!148749)) (currentByte!5020 thiss!1305) (currentBit!5015 thiss!1305)))))

(assert (=> b!102247 e!66886))

(declare-fun res!84057 () Bool)

(assert (=> b!102247 (=> (not res!84057) (not e!66886))))

(declare-fun isPrefixOf!0 (BitStream!3848 BitStream!3848) Bool)

(assert (=> b!102247 (= res!84057 (isPrefixOf!0 thiss!1305 (_2!4414 lt!148750)))))

(declare-fun lt!148755 () Unit!6270)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3848 BitStream!3848 BitStream!3848) Unit!6270)

(assert (=> b!102247 (= lt!148755 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4414 lt!148749) (_2!4414 lt!148750)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3848 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8318)

(assert (=> b!102247 (= lt!148750 (appendNLeastSignificantBitsLoop!0 (_2!4414 lt!148749) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66893 () Bool)

(assert (=> b!102247 e!66893))

(declare-fun res!84064 () Bool)

(assert (=> b!102247 (=> (not res!84064) (not e!66893))))

(assert (=> b!102247 (= res!84064 (= (size!2187 (buf!2547 thiss!1305)) (size!2187 (buf!2547 (_2!4414 lt!148749)))))))

(declare-fun appendBit!0 (BitStream!3848 Bool) tuple2!8318)

(assert (=> b!102247 (= lt!148749 (appendBit!0 thiss!1305 lt!148743))))

(assert (=> b!102247 (= lt!148743 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102248 () Bool)

(assert (=> b!102248 (= e!66886 (invariant!0 (currentBit!5015 thiss!1305) (currentByte!5020 thiss!1305) (size!2187 (buf!2547 (_2!4414 lt!148750)))))))

(declare-fun b!102249 () Bool)

(declare-fun res!84063 () Bool)

(assert (=> b!102249 (=> (not res!84063) (not e!66888))))

(assert (=> b!102249 (= res!84063 (bvslt i!615 nBits!396))))

(declare-fun res!84059 () Bool)

(declare-fun e!66892 () Bool)

(assert (=> start!20348 (=> (not res!84059) (not e!66892))))

(assert (=> start!20348 (= res!84059 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20348 e!66892))

(assert (=> start!20348 true))

(declare-fun e!66890 () Bool)

(declare-fun inv!12 (BitStream!3848) Bool)

(assert (=> start!20348 (and (inv!12 thiss!1305) e!66890)))

(declare-fun b!102250 () Bool)

(assert (=> b!102250 (= e!66891 (= (_2!4417 lt!148746) (_2!4417 lt!148742)))))

(declare-fun b!102251 () Bool)

(assert (=> b!102251 (= e!66892 e!66888)))

(declare-fun res!84061 () Bool)

(assert (=> b!102251 (=> (not res!84061) (not e!66888))))

(assert (=> b!102251 (= res!84061 (validate_offset_bits!1 ((_ sign_extend 32) (size!2187 (buf!2547 thiss!1305))) ((_ sign_extend 32) (currentByte!5020 thiss!1305)) ((_ sign_extend 32) (currentBit!5015 thiss!1305)) lt!148754))))

(assert (=> b!102251 (= lt!148754 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!102252 () Bool)

(declare-fun e!66887 () Bool)

(declare-fun lt!148744 () tuple2!8324)

(declare-fun lt!148753 () (_ BitVec 64))

(assert (=> b!102252 (= e!66887 (= (bitIndex!0 (size!2187 (buf!2547 (_1!4417 lt!148744))) (currentByte!5020 (_1!4417 lt!148744)) (currentBit!5015 (_1!4417 lt!148744))) lt!148753))))

(declare-fun b!102253 () Bool)

(declare-fun res!84065 () Bool)

(declare-fun e!66894 () Bool)

(assert (=> b!102253 (=> (not res!84065) (not e!66894))))

(assert (=> b!102253 (= res!84065 (isPrefixOf!0 thiss!1305 (_2!4414 lt!148749)))))

(declare-fun b!102254 () Bool)

(declare-fun res!84056 () Bool)

(assert (=> b!102254 (=> (not res!84056) (not e!66888))))

(assert (=> b!102254 (= res!84056 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102255 () Bool)

(assert (=> b!102255 (= e!66893 e!66894)))

(declare-fun res!84058 () Bool)

(assert (=> b!102255 (=> (not res!84058) (not e!66894))))

(declare-fun lt!148748 () (_ BitVec 64))

(assert (=> b!102255 (= res!84058 (= lt!148753 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!148748)))))

(assert (=> b!102255 (= lt!148753 (bitIndex!0 (size!2187 (buf!2547 (_2!4414 lt!148749))) (currentByte!5020 (_2!4414 lt!148749)) (currentBit!5015 (_2!4414 lt!148749))))))

(assert (=> b!102255 (= lt!148748 (bitIndex!0 (size!2187 (buf!2547 thiss!1305)) (currentByte!5020 thiss!1305) (currentBit!5015 thiss!1305)))))

(declare-fun b!102256 () Bool)

(declare-fun array_inv!1989 (array!4792) Bool)

(assert (=> b!102256 (= e!66890 (array_inv!1989 (buf!2547 thiss!1305)))))

(declare-fun b!102257 () Bool)

(assert (=> b!102257 (= e!66894 e!66887)))

(declare-fun res!84062 () Bool)

(assert (=> b!102257 (=> (not res!84062) (not e!66887))))

(assert (=> b!102257 (= res!84062 (and (= (_2!4417 lt!148744) lt!148743) (= (_1!4417 lt!148744) (_2!4414 lt!148749))))))

(declare-fun readerFrom!0 (BitStream!3848 (_ BitVec 32) (_ BitVec 32)) BitStream!3848)

(assert (=> b!102257 (= lt!148744 (readBitPure!0 (readerFrom!0 (_2!4414 lt!148749) (currentBit!5015 thiss!1305) (currentByte!5020 thiss!1305))))))

(assert (= (and start!20348 res!84059) b!102251))

(assert (= (and b!102251 res!84061) b!102254))

(assert (= (and b!102254 res!84056) b!102249))

(assert (= (and b!102249 res!84063) b!102247))

(assert (= (and b!102247 res!84064) b!102255))

(assert (= (and b!102255 res!84058) b!102253))

(assert (= (and b!102253 res!84065) b!102257))

(assert (= (and b!102257 res!84062) b!102252))

(assert (= (and b!102247 res!84057) b!102246))

(assert (= (and b!102246 res!84060) b!102248))

(assert (= (and b!102247 res!84055) b!102250))

(assert (= start!20348 b!102256))

(declare-fun m!148883 () Bool)

(assert (=> b!102246 m!148883))

(declare-fun m!148885 () Bool)

(assert (=> b!102255 m!148885))

(declare-fun m!148887 () Bool)

(assert (=> b!102255 m!148887))

(declare-fun m!148889 () Bool)

(assert (=> b!102252 m!148889))

(declare-fun m!148891 () Bool)

(assert (=> start!20348 m!148891))

(declare-fun m!148893 () Bool)

(assert (=> b!102256 m!148893))

(declare-fun m!148895 () Bool)

(assert (=> b!102253 m!148895))

(declare-fun m!148897 () Bool)

(assert (=> b!102254 m!148897))

(declare-fun m!148899 () Bool)

(assert (=> b!102251 m!148899))

(declare-fun m!148901 () Bool)

(assert (=> b!102257 m!148901))

(assert (=> b!102257 m!148901))

(declare-fun m!148903 () Bool)

(assert (=> b!102257 m!148903))

(declare-fun m!148905 () Bool)

(assert (=> b!102247 m!148905))

(declare-fun m!148907 () Bool)

(assert (=> b!102247 m!148907))

(declare-fun m!148909 () Bool)

(assert (=> b!102247 m!148909))

(declare-fun m!148911 () Bool)

(assert (=> b!102247 m!148911))

(declare-fun m!148913 () Bool)

(assert (=> b!102247 m!148913))

(declare-fun m!148915 () Bool)

(assert (=> b!102247 m!148915))

(declare-fun m!148917 () Bool)

(assert (=> b!102247 m!148917))

(declare-fun m!148919 () Bool)

(assert (=> b!102247 m!148919))

(declare-fun m!148921 () Bool)

(assert (=> b!102247 m!148921))

(declare-fun m!148923 () Bool)

(assert (=> b!102247 m!148923))

(declare-fun m!148925 () Bool)

(assert (=> b!102247 m!148925))

(declare-fun m!148927 () Bool)

(assert (=> b!102247 m!148927))

(declare-fun m!148929 () Bool)

(assert (=> b!102247 m!148929))

(declare-fun m!148931 () Bool)

(assert (=> b!102247 m!148931))

(declare-fun m!148933 () Bool)

(assert (=> b!102247 m!148933))

(declare-fun m!148935 () Bool)

(assert (=> b!102247 m!148935))

(declare-fun m!148937 () Bool)

(assert (=> b!102248 m!148937))

(push 1)

(assert (not b!102257))

(assert (not b!102255))

(assert (not b!102254))

(assert (not b!102252))

(assert (not b!102251))

(assert (not b!102256))

(assert (not b!102247))

(assert (not b!102246))

(assert (not b!102248))

(assert (not b!102253))

(assert (not start!20348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


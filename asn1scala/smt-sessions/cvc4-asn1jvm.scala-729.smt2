; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20354 () Bool)

(assert start!20354)

(declare-fun b!102354 () Bool)

(declare-fun e!66971 () Bool)

(declare-fun e!66967 () Bool)

(assert (=> b!102354 (= e!66971 e!66967)))

(declare-fun res!84156 () Bool)

(assert (=> b!102354 (=> (not res!84156) (not e!66967))))

(declare-datatypes ((array!4798 0))(
  ( (array!4799 (arr!2783 (Array (_ BitVec 32) (_ BitVec 8))) (size!2190 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3854 0))(
  ( (BitStream!3855 (buf!2550 array!4798) (currentByte!5023 (_ BitVec 32)) (currentBit!5018 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6276 0))(
  ( (Unit!6277) )
))
(declare-datatypes ((tuple2!8342 0))(
  ( (tuple2!8343 (_1!4426 Unit!6276) (_2!4426 BitStream!3854)) )
))
(declare-fun lt!148886 () tuple2!8342)

(declare-datatypes ((tuple2!8344 0))(
  ( (tuple2!8345 (_1!4427 BitStream!3854) (_2!4427 Bool)) )
))
(declare-fun lt!148893 () tuple2!8344)

(declare-fun lt!148885 () Bool)

(assert (=> b!102354 (= res!84156 (and (= (_2!4427 lt!148893) lt!148885) (= (_1!4427 lt!148893) (_2!4426 lt!148886))))))

(declare-fun thiss!1305 () BitStream!3854)

(declare-fun readBitPure!0 (BitStream!3854) tuple2!8344)

(declare-fun readerFrom!0 (BitStream!3854 (_ BitVec 32) (_ BitVec 32)) BitStream!3854)

(assert (=> b!102354 (= lt!148893 (readBitPure!0 (readerFrom!0 (_2!4426 lt!148886) (currentBit!5018 thiss!1305) (currentByte!5023 thiss!1305))))))

(declare-fun b!102355 () Bool)

(declare-fun res!84159 () Bool)

(declare-fun e!66972 () Bool)

(assert (=> b!102355 (=> (not res!84159) (not e!66972))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!102355 (= res!84159 (bvslt i!615 nBits!396))))

(declare-fun b!102356 () Bool)

(declare-fun e!66970 () Bool)

(assert (=> b!102356 (= e!66970 e!66971)))

(declare-fun res!84160 () Bool)

(assert (=> b!102356 (=> (not res!84160) (not e!66971))))

(declare-fun lt!148891 () (_ BitVec 64))

(declare-fun lt!148889 () (_ BitVec 64))

(assert (=> b!102356 (= res!84160 (= lt!148891 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!148889)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102356 (= lt!148891 (bitIndex!0 (size!2190 (buf!2550 (_2!4426 lt!148886))) (currentByte!5023 (_2!4426 lt!148886)) (currentBit!5018 (_2!4426 lt!148886))))))

(assert (=> b!102356 (= lt!148889 (bitIndex!0 (size!2190 (buf!2550 thiss!1305)) (currentByte!5023 thiss!1305) (currentBit!5018 thiss!1305)))))

(declare-fun b!102357 () Bool)

(declare-fun res!84158 () Bool)

(assert (=> b!102357 (=> (not res!84158) (not e!66972))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102357 (= res!84158 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102358 () Bool)

(declare-fun res!84161 () Bool)

(assert (=> b!102358 (=> (not res!84161) (not e!66971))))

(declare-fun isPrefixOf!0 (BitStream!3854 BitStream!3854) Bool)

(assert (=> b!102358 (= res!84161 (isPrefixOf!0 thiss!1305 (_2!4426 lt!148886)))))

(declare-fun b!102359 () Bool)

(declare-fun e!66969 () Bool)

(declare-fun lt!148894 () tuple2!8342)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102359 (= e!66969 (invariant!0 (currentBit!5018 thiss!1305) (currentByte!5023 thiss!1305) (size!2190 (buf!2550 (_2!4426 lt!148894)))))))

(declare-fun b!102360 () Bool)

(declare-fun e!66973 () Bool)

(declare-fun lt!148898 () tuple2!8344)

(declare-fun lt!148895 () tuple2!8344)

(assert (=> b!102360 (= e!66973 (= (_2!4427 lt!148898) (_2!4427 lt!148895)))))

(declare-fun b!102361 () Bool)

(declare-fun e!66974 () Bool)

(declare-fun array_inv!1992 (array!4798) Bool)

(assert (=> b!102361 (= e!66974 (array_inv!1992 (buf!2550 thiss!1305)))))

(declare-fun b!102362 () Bool)

(declare-fun e!66975 () Bool)

(assert (=> b!102362 (= e!66975 e!66972)))

(declare-fun res!84154 () Bool)

(assert (=> b!102362 (=> (not res!84154) (not e!66972))))

(declare-fun lt!148892 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102362 (= res!84154 (validate_offset_bits!1 ((_ sign_extend 32) (size!2190 (buf!2550 thiss!1305))) ((_ sign_extend 32) (currentByte!5023 thiss!1305)) ((_ sign_extend 32) (currentBit!5018 thiss!1305)) lt!148892))))

(assert (=> b!102362 (= lt!148892 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!102363 () Bool)

(declare-fun res!84157 () Bool)

(assert (=> b!102363 (=> (not res!84157) (not e!66969))))

(assert (=> b!102363 (= res!84157 (invariant!0 (currentBit!5018 thiss!1305) (currentByte!5023 thiss!1305) (size!2190 (buf!2550 (_2!4426 lt!148886)))))))

(declare-fun res!84155 () Bool)

(assert (=> start!20354 (=> (not res!84155) (not e!66975))))

(assert (=> start!20354 (= res!84155 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20354 e!66975))

(assert (=> start!20354 true))

(declare-fun inv!12 (BitStream!3854) Bool)

(assert (=> start!20354 (and (inv!12 thiss!1305) e!66974)))

(declare-fun b!102364 () Bool)

(assert (=> b!102364 (= e!66967 (= (bitIndex!0 (size!2190 (buf!2550 (_1!4427 lt!148893))) (currentByte!5023 (_1!4427 lt!148893)) (currentBit!5018 (_1!4427 lt!148893))) lt!148891))))

(declare-fun b!102365 () Bool)

(assert (=> b!102365 (= e!66972 (not true))))

(declare-datatypes ((tuple2!8346 0))(
  ( (tuple2!8347 (_1!4428 BitStream!3854) (_2!4428 BitStream!3854)) )
))
(declare-fun lt!148888 () tuple2!8346)

(declare-datatypes ((tuple2!8348 0))(
  ( (tuple2!8349 (_1!4429 BitStream!3854) (_2!4429 (_ BitVec 64))) )
))
(declare-fun lt!148896 () tuple2!8348)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8348)

(assert (=> b!102365 (= lt!148896 (readNLeastSignificantBitsLoopPure!0 (_1!4428 lt!148888) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!102365 (validate_offset_bits!1 ((_ sign_extend 32) (size!2190 (buf!2550 (_2!4426 lt!148894)))) ((_ sign_extend 32) (currentByte!5023 thiss!1305)) ((_ sign_extend 32) (currentBit!5018 thiss!1305)) lt!148892)))

(declare-fun lt!148900 () Unit!6276)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3854 array!4798 (_ BitVec 64)) Unit!6276)

(assert (=> b!102365 (= lt!148900 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2550 (_2!4426 lt!148894)) lt!148892))))

(assert (=> b!102365 (= (_2!4427 (readBitPure!0 (_1!4428 lt!148888))) lt!148885)))

(declare-fun lt!148897 () tuple2!8346)

(declare-fun reader!0 (BitStream!3854 BitStream!3854) tuple2!8346)

(assert (=> b!102365 (= lt!148897 (reader!0 (_2!4426 lt!148886) (_2!4426 lt!148894)))))

(assert (=> b!102365 (= lt!148888 (reader!0 thiss!1305 (_2!4426 lt!148894)))))

(assert (=> b!102365 e!66973))

(declare-fun res!84162 () Bool)

(assert (=> b!102365 (=> (not res!84162) (not e!66973))))

(assert (=> b!102365 (= res!84162 (= (bitIndex!0 (size!2190 (buf!2550 (_1!4427 lt!148898))) (currentByte!5023 (_1!4427 lt!148898)) (currentBit!5018 (_1!4427 lt!148898))) (bitIndex!0 (size!2190 (buf!2550 (_1!4427 lt!148895))) (currentByte!5023 (_1!4427 lt!148895)) (currentBit!5018 (_1!4427 lt!148895)))))))

(declare-fun lt!148887 () Unit!6276)

(declare-fun lt!148899 () BitStream!3854)

(declare-fun readBitPrefixLemma!0 (BitStream!3854 BitStream!3854) Unit!6276)

(assert (=> b!102365 (= lt!148887 (readBitPrefixLemma!0 lt!148899 (_2!4426 lt!148894)))))

(assert (=> b!102365 (= lt!148895 (readBitPure!0 (BitStream!3855 (buf!2550 (_2!4426 lt!148894)) (currentByte!5023 thiss!1305) (currentBit!5018 thiss!1305))))))

(assert (=> b!102365 (= lt!148898 (readBitPure!0 lt!148899))))

(assert (=> b!102365 (= lt!148899 (BitStream!3855 (buf!2550 (_2!4426 lt!148886)) (currentByte!5023 thiss!1305) (currentBit!5018 thiss!1305)))))

(assert (=> b!102365 e!66969))

(declare-fun res!84164 () Bool)

(assert (=> b!102365 (=> (not res!84164) (not e!66969))))

(assert (=> b!102365 (= res!84164 (isPrefixOf!0 thiss!1305 (_2!4426 lt!148894)))))

(declare-fun lt!148890 () Unit!6276)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3854 BitStream!3854 BitStream!3854) Unit!6276)

(assert (=> b!102365 (= lt!148890 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4426 lt!148886) (_2!4426 lt!148894)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3854 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8342)

(assert (=> b!102365 (= lt!148894 (appendNLeastSignificantBitsLoop!0 (_2!4426 lt!148886) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!102365 e!66970))

(declare-fun res!84163 () Bool)

(assert (=> b!102365 (=> (not res!84163) (not e!66970))))

(assert (=> b!102365 (= res!84163 (= (size!2190 (buf!2550 thiss!1305)) (size!2190 (buf!2550 (_2!4426 lt!148886)))))))

(declare-fun appendBit!0 (BitStream!3854 Bool) tuple2!8342)

(assert (=> b!102365 (= lt!148886 (appendBit!0 thiss!1305 lt!148885))))

(assert (=> b!102365 (= lt!148885 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!20354 res!84155) b!102362))

(assert (= (and b!102362 res!84154) b!102357))

(assert (= (and b!102357 res!84158) b!102355))

(assert (= (and b!102355 res!84159) b!102365))

(assert (= (and b!102365 res!84163) b!102356))

(assert (= (and b!102356 res!84160) b!102358))

(assert (= (and b!102358 res!84161) b!102354))

(assert (= (and b!102354 res!84156) b!102364))

(assert (= (and b!102365 res!84164) b!102363))

(assert (= (and b!102363 res!84157) b!102359))

(assert (= (and b!102365 res!84162) b!102360))

(assert (= start!20354 b!102361))

(declare-fun m!149051 () Bool)

(assert (=> b!102362 m!149051))

(declare-fun m!149053 () Bool)

(assert (=> start!20354 m!149053))

(declare-fun m!149055 () Bool)

(assert (=> b!102364 m!149055))

(declare-fun m!149057 () Bool)

(assert (=> b!102356 m!149057))

(declare-fun m!149059 () Bool)

(assert (=> b!102356 m!149059))

(declare-fun m!149061 () Bool)

(assert (=> b!102359 m!149061))

(declare-fun m!149063 () Bool)

(assert (=> b!102363 m!149063))

(declare-fun m!149065 () Bool)

(assert (=> b!102357 m!149065))

(declare-fun m!149067 () Bool)

(assert (=> b!102365 m!149067))

(declare-fun m!149069 () Bool)

(assert (=> b!102365 m!149069))

(declare-fun m!149071 () Bool)

(assert (=> b!102365 m!149071))

(declare-fun m!149073 () Bool)

(assert (=> b!102365 m!149073))

(declare-fun m!149075 () Bool)

(assert (=> b!102365 m!149075))

(declare-fun m!149077 () Bool)

(assert (=> b!102365 m!149077))

(declare-fun m!149079 () Bool)

(assert (=> b!102365 m!149079))

(declare-fun m!149081 () Bool)

(assert (=> b!102365 m!149081))

(declare-fun m!149083 () Bool)

(assert (=> b!102365 m!149083))

(declare-fun m!149085 () Bool)

(assert (=> b!102365 m!149085))

(declare-fun m!149087 () Bool)

(assert (=> b!102365 m!149087))

(declare-fun m!149089 () Bool)

(assert (=> b!102365 m!149089))

(declare-fun m!149091 () Bool)

(assert (=> b!102365 m!149091))

(declare-fun m!149093 () Bool)

(assert (=> b!102365 m!149093))

(declare-fun m!149095 () Bool)

(assert (=> b!102365 m!149095))

(declare-fun m!149097 () Bool)

(assert (=> b!102365 m!149097))

(declare-fun m!149099 () Bool)

(assert (=> b!102358 m!149099))

(declare-fun m!149101 () Bool)

(assert (=> b!102361 m!149101))

(declare-fun m!149103 () Bool)

(assert (=> b!102354 m!149103))

(assert (=> b!102354 m!149103))

(declare-fun m!149105 () Bool)

(assert (=> b!102354 m!149105))

(push 1)


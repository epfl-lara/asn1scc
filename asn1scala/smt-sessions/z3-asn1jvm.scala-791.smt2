; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22966 () Bool)

(assert start!22966)

(declare-fun b!116126 () Bool)

(declare-fun res!95989 () Bool)

(declare-fun e!76091 () Bool)

(assert (=> b!116126 (=> (not res!95989) (not e!76091))))

(declare-datatypes ((array!5230 0))(
  ( (array!5231 (arr!2965 (Array (_ BitVec 32) (_ BitVec 8))) (size!2372 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4218 0))(
  ( (BitStream!4219 (buf!2782 array!5230) (currentByte!5419 (_ BitVec 32)) (currentBit!5414 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4218)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116126 (= res!95989 (validate_offset_bits!1 ((_ sign_extend 32) (size!2372 (buf!2782 thiss!1305))) ((_ sign_extend 32) (currentByte!5419 thiss!1305)) ((_ sign_extend 32) (currentBit!5414 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!116127 () Bool)

(declare-fun res!95987 () Bool)

(assert (=> b!116127 (=> (not res!95987) (not e!76091))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116127 (= res!95987 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!116128 () Bool)

(declare-fun e!76088 () Bool)

(declare-fun e!76092 () Bool)

(assert (=> b!116128 (= e!76088 e!76092)))

(declare-fun res!95988 () Bool)

(assert (=> b!116128 (=> (not res!95988) (not e!76092))))

(declare-fun lt!177503 () (_ BitVec 64))

(declare-fun lt!177507 () (_ BitVec 64))

(assert (=> b!116128 (= res!95988 (= lt!177503 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!177507)))))

(declare-datatypes ((Unit!7149 0))(
  ( (Unit!7150) )
))
(declare-datatypes ((tuple2!9580 0))(
  ( (tuple2!9581 (_1!5055 Unit!7149) (_2!5055 BitStream!4218)) )
))
(declare-fun lt!177505 () tuple2!9580)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116128 (= lt!177503 (bitIndex!0 (size!2372 (buf!2782 (_2!5055 lt!177505))) (currentByte!5419 (_2!5055 lt!177505)) (currentBit!5414 (_2!5055 lt!177505))))))

(assert (=> b!116128 (= lt!177507 (bitIndex!0 (size!2372 (buf!2782 thiss!1305)) (currentByte!5419 thiss!1305) (currentBit!5414 thiss!1305)))))

(declare-fun b!116129 () Bool)

(assert (=> b!116129 (= e!76091 (not true))))

(declare-datatypes ((tuple2!9582 0))(
  ( (tuple2!9583 (_1!5056 BitStream!4218) (_2!5056 BitStream!4218)) )
))
(declare-fun lt!177506 () tuple2!9582)

(declare-fun lt!177509 () Bool)

(declare-datatypes ((tuple2!9584 0))(
  ( (tuple2!9585 (_1!5057 BitStream!4218) (_2!5057 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!4218) tuple2!9584)

(assert (=> b!116129 (= (_2!5057 (readBitPure!0 (_1!5056 lt!177506))) lt!177509)))

(declare-fun lt!177511 () tuple2!9582)

(declare-fun lt!177508 () tuple2!9580)

(declare-fun reader!0 (BitStream!4218 BitStream!4218) tuple2!9582)

(assert (=> b!116129 (= lt!177511 (reader!0 (_2!5055 lt!177505) (_2!5055 lt!177508)))))

(assert (=> b!116129 (= lt!177506 (reader!0 thiss!1305 (_2!5055 lt!177508)))))

(declare-fun e!76090 () Bool)

(assert (=> b!116129 e!76090))

(declare-fun res!95994 () Bool)

(assert (=> b!116129 (=> (not res!95994) (not e!76090))))

(declare-fun lt!177513 () tuple2!9584)

(declare-fun lt!177504 () tuple2!9584)

(assert (=> b!116129 (= res!95994 (= (bitIndex!0 (size!2372 (buf!2782 (_1!5057 lt!177513))) (currentByte!5419 (_1!5057 lt!177513)) (currentBit!5414 (_1!5057 lt!177513))) (bitIndex!0 (size!2372 (buf!2782 (_1!5057 lt!177504))) (currentByte!5419 (_1!5057 lt!177504)) (currentBit!5414 (_1!5057 lt!177504)))))))

(declare-fun lt!177512 () Unit!7149)

(declare-fun lt!177510 () BitStream!4218)

(declare-fun readBitPrefixLemma!0 (BitStream!4218 BitStream!4218) Unit!7149)

(assert (=> b!116129 (= lt!177512 (readBitPrefixLemma!0 lt!177510 (_2!5055 lt!177508)))))

(assert (=> b!116129 (= lt!177504 (readBitPure!0 (BitStream!4219 (buf!2782 (_2!5055 lt!177508)) (currentByte!5419 thiss!1305) (currentBit!5414 thiss!1305))))))

(assert (=> b!116129 (= lt!177513 (readBitPure!0 lt!177510))))

(assert (=> b!116129 (= lt!177510 (BitStream!4219 (buf!2782 (_2!5055 lt!177505)) (currentByte!5419 thiss!1305) (currentBit!5414 thiss!1305)))))

(declare-fun e!76086 () Bool)

(assert (=> b!116129 e!76086))

(declare-fun res!95990 () Bool)

(assert (=> b!116129 (=> (not res!95990) (not e!76086))))

(declare-fun isPrefixOf!0 (BitStream!4218 BitStream!4218) Bool)

(assert (=> b!116129 (= res!95990 (isPrefixOf!0 thiss!1305 (_2!5055 lt!177508)))))

(declare-fun lt!177502 () Unit!7149)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4218 BitStream!4218 BitStream!4218) Unit!7149)

(assert (=> b!116129 (= lt!177502 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5055 lt!177505) (_2!5055 lt!177508)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4218 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9580)

(assert (=> b!116129 (= lt!177508 (appendNLeastSignificantBitsLoop!0 (_2!5055 lt!177505) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!116129 e!76088))

(declare-fun res!95991 () Bool)

(assert (=> b!116129 (=> (not res!95991) (not e!76088))))

(assert (=> b!116129 (= res!95991 (= (size!2372 (buf!2782 thiss!1305)) (size!2372 (buf!2782 (_2!5055 lt!177505)))))))

(declare-fun appendBit!0 (BitStream!4218 Bool) tuple2!9580)

(assert (=> b!116129 (= lt!177505 (appendBit!0 thiss!1305 lt!177509))))

(assert (=> b!116129 (= lt!177509 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!95985 () Bool)

(assert (=> start!22966 (=> (not res!95985) (not e!76091))))

(assert (=> start!22966 (= res!95985 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22966 e!76091))

(assert (=> start!22966 true))

(declare-fun e!76087 () Bool)

(declare-fun inv!12 (BitStream!4218) Bool)

(assert (=> start!22966 (and (inv!12 thiss!1305) e!76087)))

(declare-fun b!116130 () Bool)

(declare-fun e!76089 () Bool)

(declare-fun lt!177501 () tuple2!9584)

(assert (=> b!116130 (= e!76089 (= (bitIndex!0 (size!2372 (buf!2782 (_1!5057 lt!177501))) (currentByte!5419 (_1!5057 lt!177501)) (currentBit!5414 (_1!5057 lt!177501))) lt!177503))))

(declare-fun b!116131 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116131 (= e!76086 (invariant!0 (currentBit!5414 thiss!1305) (currentByte!5419 thiss!1305) (size!2372 (buf!2782 (_2!5055 lt!177508)))))))

(declare-fun b!116132 () Bool)

(declare-fun array_inv!2174 (array!5230) Bool)

(assert (=> b!116132 (= e!76087 (array_inv!2174 (buf!2782 thiss!1305)))))

(declare-fun b!116133 () Bool)

(assert (=> b!116133 (= e!76090 (= (_2!5057 lt!177513) (_2!5057 lt!177504)))))

(declare-fun b!116134 () Bool)

(declare-fun res!95992 () Bool)

(assert (=> b!116134 (=> (not res!95992) (not e!76092))))

(assert (=> b!116134 (= res!95992 (isPrefixOf!0 thiss!1305 (_2!5055 lt!177505)))))

(declare-fun b!116135 () Bool)

(declare-fun res!95993 () Bool)

(assert (=> b!116135 (=> (not res!95993) (not e!76091))))

(assert (=> b!116135 (= res!95993 (bvslt i!615 nBits!396))))

(declare-fun b!116136 () Bool)

(assert (=> b!116136 (= e!76092 e!76089)))

(declare-fun res!95986 () Bool)

(assert (=> b!116136 (=> (not res!95986) (not e!76089))))

(assert (=> b!116136 (= res!95986 (and (= (_2!5057 lt!177501) lt!177509) (= (_1!5057 lt!177501) (_2!5055 lt!177505))))))

(declare-fun readerFrom!0 (BitStream!4218 (_ BitVec 32) (_ BitVec 32)) BitStream!4218)

(assert (=> b!116136 (= lt!177501 (readBitPure!0 (readerFrom!0 (_2!5055 lt!177505) (currentBit!5414 thiss!1305) (currentByte!5419 thiss!1305))))))

(declare-fun b!116137 () Bool)

(declare-fun res!95984 () Bool)

(assert (=> b!116137 (=> (not res!95984) (not e!76086))))

(assert (=> b!116137 (= res!95984 (invariant!0 (currentBit!5414 thiss!1305) (currentByte!5419 thiss!1305) (size!2372 (buf!2782 (_2!5055 lt!177505)))))))

(assert (= (and start!22966 res!95985) b!116126))

(assert (= (and b!116126 res!95989) b!116127))

(assert (= (and b!116127 res!95987) b!116135))

(assert (= (and b!116135 res!95993) b!116129))

(assert (= (and b!116129 res!95991) b!116128))

(assert (= (and b!116128 res!95988) b!116134))

(assert (= (and b!116134 res!95992) b!116136))

(assert (= (and b!116136 res!95986) b!116130))

(assert (= (and b!116129 res!95990) b!116137))

(assert (= (and b!116137 res!95984) b!116131))

(assert (= (and b!116129 res!95994) b!116133))

(assert (= start!22966 b!116132))

(declare-fun m!173891 () Bool)

(assert (=> b!116131 m!173891))

(declare-fun m!173893 () Bool)

(assert (=> b!116130 m!173893))

(declare-fun m!173895 () Bool)

(assert (=> b!116136 m!173895))

(assert (=> b!116136 m!173895))

(declare-fun m!173897 () Bool)

(assert (=> b!116136 m!173897))

(declare-fun m!173899 () Bool)

(assert (=> b!116128 m!173899))

(declare-fun m!173901 () Bool)

(assert (=> b!116128 m!173901))

(declare-fun m!173903 () Bool)

(assert (=> b!116129 m!173903))

(declare-fun m!173905 () Bool)

(assert (=> b!116129 m!173905))

(declare-fun m!173907 () Bool)

(assert (=> b!116129 m!173907))

(declare-fun m!173909 () Bool)

(assert (=> b!116129 m!173909))

(declare-fun m!173911 () Bool)

(assert (=> b!116129 m!173911))

(declare-fun m!173913 () Bool)

(assert (=> b!116129 m!173913))

(declare-fun m!173915 () Bool)

(assert (=> b!116129 m!173915))

(declare-fun m!173917 () Bool)

(assert (=> b!116129 m!173917))

(declare-fun m!173919 () Bool)

(assert (=> b!116129 m!173919))

(declare-fun m!173921 () Bool)

(assert (=> b!116129 m!173921))

(declare-fun m!173923 () Bool)

(assert (=> b!116129 m!173923))

(declare-fun m!173925 () Bool)

(assert (=> b!116129 m!173925))

(declare-fun m!173927 () Bool)

(assert (=> b!116134 m!173927))

(declare-fun m!173929 () Bool)

(assert (=> b!116126 m!173929))

(declare-fun m!173931 () Bool)

(assert (=> start!22966 m!173931))

(declare-fun m!173933 () Bool)

(assert (=> b!116127 m!173933))

(declare-fun m!173935 () Bool)

(assert (=> b!116137 m!173935))

(declare-fun m!173937 () Bool)

(assert (=> b!116132 m!173937))

(check-sat (not b!116131) (not start!22966) (not b!116126) (not b!116129) (not b!116128) (not b!116137) (not b!116127) (not b!116132) (not b!116136) (not b!116130) (not b!116134))

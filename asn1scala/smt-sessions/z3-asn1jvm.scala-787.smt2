; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22858 () Bool)

(assert start!22858)

(declare-fun b!115382 () Bool)

(declare-fun e!75627 () Bool)

(declare-datatypes ((array!5203 0))(
  ( (array!5204 (arr!2953 (Array (_ BitVec 32) (_ BitVec 8))) (size!2360 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4194 0))(
  ( (BitStream!4195 (buf!2770 array!5203) (currentByte!5398 (_ BitVec 32)) (currentBit!5393 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9496 0))(
  ( (tuple2!9497 (_1!5013 BitStream!4194) (_2!5013 Bool)) )
))
(declare-fun lt!176159 () tuple2!9496)

(declare-fun lt!176158 () tuple2!9496)

(assert (=> b!115382 (= e!75627 (= (_2!5013 lt!176159) (_2!5013 lt!176158)))))

(declare-fun b!115383 () Bool)

(declare-fun e!75626 () Bool)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!115383 (= e!75626 (not (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!9498 0))(
  ( (tuple2!9499 (_1!5014 BitStream!4194) (_2!5014 BitStream!4194)) )
))
(declare-fun lt!176155 () tuple2!9498)

(declare-fun lt!176157 () Bool)

(declare-fun readBitPure!0 (BitStream!4194) tuple2!9496)

(assert (=> b!115383 (= (_2!5013 (readBitPure!0 (_1!5014 lt!176155))) lt!176157)))

(declare-fun lt!176163 () tuple2!9498)

(declare-datatypes ((Unit!7101 0))(
  ( (Unit!7102) )
))
(declare-datatypes ((tuple2!9500 0))(
  ( (tuple2!9501 (_1!5015 Unit!7101) (_2!5015 BitStream!4194)) )
))
(declare-fun lt!176160 () tuple2!9500)

(declare-fun lt!176164 () tuple2!9500)

(declare-fun reader!0 (BitStream!4194 BitStream!4194) tuple2!9498)

(assert (=> b!115383 (= lt!176163 (reader!0 (_2!5015 lt!176160) (_2!5015 lt!176164)))))

(declare-fun thiss!1305 () BitStream!4194)

(assert (=> b!115383 (= lt!176155 (reader!0 thiss!1305 (_2!5015 lt!176164)))))

(assert (=> b!115383 e!75627))

(declare-fun res!95336 () Bool)

(assert (=> b!115383 (=> (not res!95336) (not e!75627))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115383 (= res!95336 (= (bitIndex!0 (size!2360 (buf!2770 (_1!5013 lt!176159))) (currentByte!5398 (_1!5013 lt!176159)) (currentBit!5393 (_1!5013 lt!176159))) (bitIndex!0 (size!2360 (buf!2770 (_1!5013 lt!176158))) (currentByte!5398 (_1!5013 lt!176158)) (currentBit!5393 (_1!5013 lt!176158)))))))

(declare-fun lt!176165 () Unit!7101)

(declare-fun lt!176156 () BitStream!4194)

(declare-fun readBitPrefixLemma!0 (BitStream!4194 BitStream!4194) Unit!7101)

(assert (=> b!115383 (= lt!176165 (readBitPrefixLemma!0 lt!176156 (_2!5015 lt!176164)))))

(assert (=> b!115383 (= lt!176158 (readBitPure!0 (BitStream!4195 (buf!2770 (_2!5015 lt!176164)) (currentByte!5398 thiss!1305) (currentBit!5393 thiss!1305))))))

(assert (=> b!115383 (= lt!176159 (readBitPure!0 lt!176156))))

(assert (=> b!115383 (= lt!176156 (BitStream!4195 (buf!2770 (_2!5015 lt!176160)) (currentByte!5398 thiss!1305) (currentBit!5393 thiss!1305)))))

(declare-fun e!75621 () Bool)

(assert (=> b!115383 e!75621))

(declare-fun res!95343 () Bool)

(assert (=> b!115383 (=> (not res!95343) (not e!75621))))

(declare-fun isPrefixOf!0 (BitStream!4194 BitStream!4194) Bool)

(assert (=> b!115383 (= res!95343 (isPrefixOf!0 thiss!1305 (_2!5015 lt!176164)))))

(declare-fun lt!176162 () Unit!7101)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4194 BitStream!4194 BitStream!4194) Unit!7101)

(assert (=> b!115383 (= lt!176162 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5015 lt!176160) (_2!5015 lt!176164)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4194 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9500)

(assert (=> b!115383 (= lt!176164 (appendNLeastSignificantBitsLoop!0 (_2!5015 lt!176160) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!75625 () Bool)

(assert (=> b!115383 e!75625))

(declare-fun res!95341 () Bool)

(assert (=> b!115383 (=> (not res!95341) (not e!75625))))

(assert (=> b!115383 (= res!95341 (= (size!2360 (buf!2770 thiss!1305)) (size!2360 (buf!2770 (_2!5015 lt!176160)))))))

(declare-fun appendBit!0 (BitStream!4194 Bool) tuple2!9500)

(assert (=> b!115383 (= lt!176160 (appendBit!0 thiss!1305 lt!176157))))

(assert (=> b!115383 (= lt!176157 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115384 () Bool)

(declare-fun e!75622 () Bool)

(assert (=> b!115384 (= e!75625 e!75622)))

(declare-fun res!95345 () Bool)

(assert (=> b!115384 (=> (not res!95345) (not e!75622))))

(declare-fun lt!176154 () (_ BitVec 64))

(declare-fun lt!176161 () (_ BitVec 64))

(assert (=> b!115384 (= res!95345 (= lt!176154 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!176161)))))

(assert (=> b!115384 (= lt!176154 (bitIndex!0 (size!2360 (buf!2770 (_2!5015 lt!176160))) (currentByte!5398 (_2!5015 lt!176160)) (currentBit!5393 (_2!5015 lt!176160))))))

(assert (=> b!115384 (= lt!176161 (bitIndex!0 (size!2360 (buf!2770 thiss!1305)) (currentByte!5398 thiss!1305) (currentBit!5393 thiss!1305)))))

(declare-fun res!95338 () Bool)

(assert (=> start!22858 (=> (not res!95338) (not e!75626))))

(assert (=> start!22858 (= res!95338 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22858 e!75626))

(assert (=> start!22858 true))

(declare-fun e!75620 () Bool)

(declare-fun inv!12 (BitStream!4194) Bool)

(assert (=> start!22858 (and (inv!12 thiss!1305) e!75620)))

(declare-fun b!115385 () Bool)

(declare-fun e!75623 () Bool)

(assert (=> b!115385 (= e!75622 e!75623)))

(declare-fun res!95346 () Bool)

(assert (=> b!115385 (=> (not res!95346) (not e!75623))))

(declare-fun lt!176166 () tuple2!9496)

(assert (=> b!115385 (= res!95346 (and (= (_2!5013 lt!176166) lt!176157) (= (_1!5013 lt!176166) (_2!5015 lt!176160))))))

(declare-fun readerFrom!0 (BitStream!4194 (_ BitVec 32) (_ BitVec 32)) BitStream!4194)

(assert (=> b!115385 (= lt!176166 (readBitPure!0 (readerFrom!0 (_2!5015 lt!176160) (currentBit!5393 thiss!1305) (currentByte!5398 thiss!1305))))))

(declare-fun b!115386 () Bool)

(assert (=> b!115386 (= e!75623 (= (bitIndex!0 (size!2360 (buf!2770 (_1!5013 lt!176166))) (currentByte!5398 (_1!5013 lt!176166)) (currentBit!5393 (_1!5013 lt!176166))) lt!176154))))

(declare-fun b!115387 () Bool)

(declare-fun res!95340 () Bool)

(assert (=> b!115387 (=> (not res!95340) (not e!75626))))

(assert (=> b!115387 (= res!95340 (bvslt i!615 nBits!396))))

(declare-fun b!115388 () Bool)

(declare-fun res!95339 () Bool)

(assert (=> b!115388 (=> (not res!95339) (not e!75621))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!115388 (= res!95339 (invariant!0 (currentBit!5393 thiss!1305) (currentByte!5398 thiss!1305) (size!2360 (buf!2770 (_2!5015 lt!176160)))))))

(declare-fun b!115389 () Bool)

(declare-fun res!95344 () Bool)

(assert (=> b!115389 (=> (not res!95344) (not e!75626))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115389 (= res!95344 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!115390 () Bool)

(assert (=> b!115390 (= e!75621 (invariant!0 (currentBit!5393 thiss!1305) (currentByte!5398 thiss!1305) (size!2360 (buf!2770 (_2!5015 lt!176164)))))))

(declare-fun b!115391 () Bool)

(declare-fun res!95342 () Bool)

(assert (=> b!115391 (=> (not res!95342) (not e!75622))))

(assert (=> b!115391 (= res!95342 (isPrefixOf!0 thiss!1305 (_2!5015 lt!176160)))))

(declare-fun b!115392 () Bool)

(declare-fun res!95337 () Bool)

(assert (=> b!115392 (=> (not res!95337) (not e!75626))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115392 (= res!95337 (validate_offset_bits!1 ((_ sign_extend 32) (size!2360 (buf!2770 thiss!1305))) ((_ sign_extend 32) (currentByte!5398 thiss!1305)) ((_ sign_extend 32) (currentBit!5393 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!115393 () Bool)

(declare-fun array_inv!2162 (array!5203) Bool)

(assert (=> b!115393 (= e!75620 (array_inv!2162 (buf!2770 thiss!1305)))))

(assert (= (and start!22858 res!95338) b!115392))

(assert (= (and b!115392 res!95337) b!115389))

(assert (= (and b!115389 res!95344) b!115387))

(assert (= (and b!115387 res!95340) b!115383))

(assert (= (and b!115383 res!95341) b!115384))

(assert (= (and b!115384 res!95345) b!115391))

(assert (= (and b!115391 res!95342) b!115385))

(assert (= (and b!115385 res!95346) b!115386))

(assert (= (and b!115383 res!95343) b!115388))

(assert (= (and b!115388 res!95339) b!115390))

(assert (= (and b!115383 res!95336) b!115382))

(assert (= start!22858 b!115393))

(declare-fun m!172715 () Bool)

(assert (=> b!115386 m!172715))

(declare-fun m!172717 () Bool)

(assert (=> b!115392 m!172717))

(declare-fun m!172719 () Bool)

(assert (=> b!115389 m!172719))

(declare-fun m!172721 () Bool)

(assert (=> b!115391 m!172721))

(declare-fun m!172723 () Bool)

(assert (=> b!115385 m!172723))

(assert (=> b!115385 m!172723))

(declare-fun m!172725 () Bool)

(assert (=> b!115385 m!172725))

(declare-fun m!172727 () Bool)

(assert (=> b!115390 m!172727))

(declare-fun m!172729 () Bool)

(assert (=> b!115388 m!172729))

(declare-fun m!172731 () Bool)

(assert (=> b!115384 m!172731))

(declare-fun m!172733 () Bool)

(assert (=> b!115384 m!172733))

(declare-fun m!172735 () Bool)

(assert (=> b!115393 m!172735))

(declare-fun m!172737 () Bool)

(assert (=> start!22858 m!172737))

(declare-fun m!172739 () Bool)

(assert (=> b!115383 m!172739))

(declare-fun m!172741 () Bool)

(assert (=> b!115383 m!172741))

(declare-fun m!172743 () Bool)

(assert (=> b!115383 m!172743))

(declare-fun m!172745 () Bool)

(assert (=> b!115383 m!172745))

(declare-fun m!172747 () Bool)

(assert (=> b!115383 m!172747))

(declare-fun m!172749 () Bool)

(assert (=> b!115383 m!172749))

(declare-fun m!172751 () Bool)

(assert (=> b!115383 m!172751))

(declare-fun m!172753 () Bool)

(assert (=> b!115383 m!172753))

(declare-fun m!172755 () Bool)

(assert (=> b!115383 m!172755))

(declare-fun m!172757 () Bool)

(assert (=> b!115383 m!172757))

(declare-fun m!172759 () Bool)

(assert (=> b!115383 m!172759))

(declare-fun m!172761 () Bool)

(assert (=> b!115383 m!172761))

(check-sat (not b!115393) (not b!115389) (not b!115391) (not b!115392) (not b!115388) (not b!115385) (not b!115386) (not b!115384) (not b!115390) (not b!115383) (not start!22858))
(check-sat)

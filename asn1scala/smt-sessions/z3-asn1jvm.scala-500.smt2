; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14762 () Bool)

(assert start!14762)

(declare-fun b!76078 () Bool)

(declare-fun res!62904 () Bool)

(declare-fun e!49859 () Bool)

(assert (=> b!76078 (=> (not res!62904) (not e!49859))))

(declare-datatypes ((array!3129 0))(
  ( (array!3130 (arr!2056 (Array (_ BitVec 32) (_ BitVec 8))) (size!1458 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2490 0))(
  ( (BitStream!2491 (buf!1839 array!3129) (currentByte!3630 (_ BitVec 32)) (currentBit!3625 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2490)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76078 (= res!62904 (validate_offset_bits!1 ((_ sign_extend 32) (size!1458 (buf!1839 thiss!1379))) ((_ sign_extend 32) (currentByte!3630 thiss!1379)) ((_ sign_extend 32) (currentBit!3625 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76079 () Bool)

(declare-fun e!49855 () Bool)

(assert (=> b!76079 (= e!49859 (not e!49855))))

(declare-fun res!62907 () Bool)

(assert (=> b!76079 (=> res!62907 e!49855)))

(declare-fun lt!122092 () (_ BitVec 64))

(assert (=> b!76079 (= res!62907 (or (bvslt i!635 to!314) (not (= lt!122092 (bvsub (bvadd lt!122092 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2490 BitStream!2490) Bool)

(assert (=> b!76079 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5016 0))(
  ( (Unit!5017) )
))
(declare-fun lt!122094 () Unit!5016)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2490) Unit!5016)

(assert (=> b!76079 (= lt!122094 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76079 (= lt!122092 (bitIndex!0 (size!1458 (buf!1839 thiss!1379)) (currentByte!3630 thiss!1379) (currentBit!3625 thiss!1379)))))

(declare-fun b!76080 () Bool)

(declare-fun e!49857 () Bool)

(declare-fun array_inv!1304 (array!3129) Bool)

(assert (=> b!76080 (= e!49857 (array_inv!1304 (buf!1839 thiss!1379)))))

(declare-fun b!76081 () Bool)

(declare-fun e!49860 () Bool)

(assert (=> b!76081 (= e!49860 true)))

(declare-fun srcBuffer!2 () array!3129)

(declare-datatypes ((tuple2!6590 0))(
  ( (tuple2!6591 (_1!3426 array!3129) (_2!3426 BitStream!2490)) )
))
(declare-fun lt!122093 () tuple2!6590)

(declare-fun checkByteArrayBitContent!0 (BitStream!2490 array!3129 array!3129 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76081 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3426 lt!122093) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!76082 () Bool)

(assert (=> b!76082 (= e!49855 e!49860)))

(declare-fun res!62906 () Bool)

(assert (=> b!76082 (=> res!62906 e!49860)))

(assert (=> b!76082 (= res!62906 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2490 (_ BitVec 64)) tuple2!6590)

(declare-datatypes ((tuple2!6592 0))(
  ( (tuple2!6593 (_1!3427 BitStream!2490) (_2!3427 BitStream!2490)) )
))
(declare-fun reader!0 (BitStream!2490 BitStream!2490) tuple2!6592)

(assert (=> b!76082 (= lt!122093 (readBits!0 (_1!3427 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76083 () Bool)

(declare-fun res!62905 () Bool)

(assert (=> b!76083 (=> res!62905 e!49855)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76083 (= res!62905 (not (invariant!0 (currentBit!3625 thiss!1379) (currentByte!3630 thiss!1379) (size!1458 (buf!1839 thiss!1379)))))))

(declare-fun res!62908 () Bool)

(assert (=> start!14762 (=> (not res!62908) (not e!49859))))

(assert (=> start!14762 (= res!62908 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1458 srcBuffer!2))))))))

(assert (=> start!14762 e!49859))

(assert (=> start!14762 true))

(assert (=> start!14762 (array_inv!1304 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2490) Bool)

(assert (=> start!14762 (and (inv!12 thiss!1379) e!49857)))

(assert (= (and start!14762 res!62908) b!76078))

(assert (= (and b!76078 res!62904) b!76079))

(assert (= (and b!76079 (not res!62907)) b!76083))

(assert (= (and b!76083 (not res!62905)) b!76082))

(assert (= (and b!76082 (not res!62906)) b!76081))

(assert (= start!14762 b!76080))

(declare-fun m!121257 () Bool)

(assert (=> b!76080 m!121257))

(declare-fun m!121259 () Bool)

(assert (=> b!76081 m!121259))

(declare-fun m!121261 () Bool)

(assert (=> start!14762 m!121261))

(declare-fun m!121263 () Bool)

(assert (=> start!14762 m!121263))

(declare-fun m!121265 () Bool)

(assert (=> b!76078 m!121265))

(declare-fun m!121267 () Bool)

(assert (=> b!76079 m!121267))

(declare-fun m!121269 () Bool)

(assert (=> b!76079 m!121269))

(declare-fun m!121271 () Bool)

(assert (=> b!76079 m!121271))

(declare-fun m!121273 () Bool)

(assert (=> b!76083 m!121273))

(declare-fun m!121275 () Bool)

(assert (=> b!76082 m!121275))

(declare-fun m!121277 () Bool)

(assert (=> b!76082 m!121277))

(check-sat (not b!76083) (not b!76079) (not b!76080) (not b!76078) (not b!76082) (not start!14762) (not b!76081))

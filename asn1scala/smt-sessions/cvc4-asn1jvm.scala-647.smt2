; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18104 () Bool)

(assert start!18104)

(declare-fun b!89129 () Bool)

(declare-fun res!73390 () Bool)

(declare-fun e!58909 () Bool)

(assert (=> b!89129 (=> (not res!73390) (not e!58909))))

(declare-datatypes ((array!4210 0))(
  ( (array!4211 (arr!2537 (Array (_ BitVec 32) (_ BitVec 8))) (size!1900 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3362 0))(
  ( (BitStream!3363 (buf!2290 array!4210) (currentByte!4544 (_ BitVec 32)) (currentBit!4539 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3362)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89129 (= res!73390 (validate_offset_bits!1 ((_ sign_extend 32) (size!1900 (buf!2290 thiss!1151))) ((_ sign_extend 32) (currentByte!4544 thiss!1151)) ((_ sign_extend 32) (currentBit!4539 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!89130 () Bool)

(declare-fun e!58912 () Bool)

(declare-fun e!58914 () Bool)

(assert (=> b!89130 (= e!58912 e!58914)))

(declare-fun res!73384 () Bool)

(assert (=> b!89130 (=> (not res!73384) (not e!58914))))

(declare-datatypes ((Unit!5783 0))(
  ( (Unit!5784) )
))
(declare-datatypes ((tuple2!7476 0))(
  ( (tuple2!7477 (_1!3971 Unit!5783) (_2!3971 BitStream!3362)) )
))
(declare-fun lt!136407 () tuple2!7476)

(declare-datatypes ((tuple2!7478 0))(
  ( (tuple2!7479 (_1!3972 BitStream!3362) (_2!3972 Bool)) )
))
(declare-fun lt!136406 () tuple2!7478)

(declare-fun lt!136409 () Bool)

(assert (=> b!89130 (= res!73384 (and (= (_2!3972 lt!136406) lt!136409) (= (_1!3972 lt!136406) (_2!3971 lt!136407))))))

(declare-fun thiss!1152 () BitStream!3362)

(declare-fun readBitPure!0 (BitStream!3362) tuple2!7478)

(declare-fun readerFrom!0 (BitStream!3362 (_ BitVec 32) (_ BitVec 32)) BitStream!3362)

(assert (=> b!89130 (= lt!136406 (readBitPure!0 (readerFrom!0 (_2!3971 lt!136407) (currentBit!4539 thiss!1152) (currentByte!4544 thiss!1152))))))

(declare-fun b!89131 () Bool)

(declare-fun e!58911 () Bool)

(declare-fun array_inv!1746 (array!4210) Bool)

(assert (=> b!89131 (= e!58911 (array_inv!1746 (buf!2290 thiss!1152)))))

(declare-fun res!73388 () Bool)

(assert (=> start!18104 (=> (not res!73388) (not e!58909))))

(assert (=> start!18104 (= res!73388 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18104 e!58909))

(declare-fun inv!12 (BitStream!3362) Bool)

(assert (=> start!18104 (and (inv!12 thiss!1152) e!58911)))

(declare-fun e!58906 () Bool)

(assert (=> start!18104 (and (inv!12 thiss!1151) e!58906)))

(assert (=> start!18104 true))

(declare-fun b!89132 () Bool)

(declare-fun e!58913 () Bool)

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!89132 (= e!58913 (not (or (not (= (bvand i!576 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!576 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!576) #b10000000000000000000000000000000)))))))

(declare-fun e!58908 () Bool)

(assert (=> b!89132 e!58908))

(declare-fun res!73393 () Bool)

(assert (=> b!89132 (=> (not res!73393) (not e!58908))))

(assert (=> b!89132 (= res!73393 (= (size!1900 (buf!2290 thiss!1152)) (size!1900 (buf!2290 (_2!3971 lt!136407)))))))

(declare-fun appendBit!0 (BitStream!3362 Bool) tuple2!7476)

(assert (=> b!89132 (= lt!136407 (appendBit!0 thiss!1152 lt!136409))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!89132 (= lt!136409 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89133 () Bool)

(declare-fun lt!136408 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!89133 (= e!58914 (= (bitIndex!0 (size!1900 (buf!2290 (_1!3972 lt!136406))) (currentByte!4544 (_1!3972 lt!136406)) (currentBit!4539 (_1!3972 lt!136406))) lt!136408))))

(declare-fun b!89134 () Bool)

(declare-fun res!73385 () Bool)

(assert (=> b!89134 (=> (not res!73385) (not e!58909))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!89134 (= res!73385 (invariant!0 (currentBit!4539 thiss!1151) (currentByte!4544 thiss!1151) (size!1900 (buf!2290 thiss!1151))))))

(declare-fun b!89135 () Bool)

(declare-fun res!73396 () Bool)

(assert (=> b!89135 (=> (not res!73396) (not e!58913))))

(assert (=> b!89135 (= res!73396 (validate_offset_bits!1 ((_ sign_extend 32) (size!1900 (buf!2290 thiss!1152))) ((_ sign_extend 32) (currentByte!4544 thiss!1152)) ((_ sign_extend 32) (currentBit!4539 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!89136 () Bool)

(declare-fun res!73387 () Bool)

(assert (=> b!89136 (=> (not res!73387) (not e!58909))))

(assert (=> b!89136 (= res!73387 (and (bvsle i!576 nBits!336) (= (size!1900 (buf!2290 thiss!1152)) (size!1900 (buf!2290 thiss!1151)))))))

(declare-fun b!89137 () Bool)

(declare-fun res!73391 () Bool)

(assert (=> b!89137 (=> (not res!73391) (not e!58912))))

(declare-fun isPrefixOf!0 (BitStream!3362 BitStream!3362) Bool)

(assert (=> b!89137 (= res!73391 (isPrefixOf!0 thiss!1152 (_2!3971 lt!136407)))))

(declare-fun b!89138 () Bool)

(declare-fun res!73386 () Bool)

(assert (=> b!89138 (=> (not res!73386) (not e!58909))))

(assert (=> b!89138 (= res!73386 (invariant!0 (currentBit!4539 thiss!1152) (currentByte!4544 thiss!1152) (size!1900 (buf!2290 thiss!1152))))))

(declare-fun b!89139 () Bool)

(assert (=> b!89139 (= e!58906 (array_inv!1746 (buf!2290 thiss!1151)))))

(declare-fun b!89140 () Bool)

(declare-fun res!73392 () Bool)

(assert (=> b!89140 (=> (not res!73392) (not e!58913))))

(assert (=> b!89140 (= res!73392 (bvslt i!576 nBits!336))))

(declare-fun b!89141 () Bool)

(assert (=> b!89141 (= e!58909 e!58913)))

(declare-fun res!73394 () Bool)

(assert (=> b!89141 (=> (not res!73394) (not e!58913))))

(declare-fun lt!136405 () (_ BitVec 64))

(declare-fun lt!136410 () (_ BitVec 64))

(assert (=> b!89141 (= res!73394 (= lt!136405 (bvadd lt!136410 ((_ sign_extend 32) i!576))))))

(assert (=> b!89141 (= lt!136405 (bitIndex!0 (size!1900 (buf!2290 thiss!1152)) (currentByte!4544 thiss!1152) (currentBit!4539 thiss!1152)))))

(assert (=> b!89141 (= lt!136410 (bitIndex!0 (size!1900 (buf!2290 thiss!1151)) (currentByte!4544 thiss!1151) (currentBit!4539 thiss!1151)))))

(declare-fun b!89142 () Bool)

(declare-fun res!73389 () Bool)

(assert (=> b!89142 (=> (not res!73389) (not e!58909))))

(assert (=> b!89142 (= res!73389 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!89143 () Bool)

(assert (=> b!89143 (= e!58908 e!58912)))

(declare-fun res!73395 () Bool)

(assert (=> b!89143 (=> (not res!73395) (not e!58912))))

(assert (=> b!89143 (= res!73395 (= lt!136408 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136405)))))

(assert (=> b!89143 (= lt!136408 (bitIndex!0 (size!1900 (buf!2290 (_2!3971 lt!136407))) (currentByte!4544 (_2!3971 lt!136407)) (currentBit!4539 (_2!3971 lt!136407))))))

(assert (= (and start!18104 res!73388) b!89129))

(assert (= (and b!89129 res!73390) b!89134))

(assert (= (and b!89134 res!73385) b!89142))

(assert (= (and b!89142 res!73389) b!89138))

(assert (= (and b!89138 res!73386) b!89136))

(assert (= (and b!89136 res!73387) b!89141))

(assert (= (and b!89141 res!73394) b!89135))

(assert (= (and b!89135 res!73396) b!89140))

(assert (= (and b!89140 res!73392) b!89132))

(assert (= (and b!89132 res!73393) b!89143))

(assert (= (and b!89143 res!73395) b!89137))

(assert (= (and b!89137 res!73391) b!89130))

(assert (= (and b!89130 res!73384) b!89133))

(assert (= start!18104 b!89131))

(assert (= start!18104 b!89139))

(declare-fun m!134061 () Bool)

(assert (=> b!89132 m!134061))

(declare-fun m!134063 () Bool)

(assert (=> start!18104 m!134063))

(declare-fun m!134065 () Bool)

(assert (=> start!18104 m!134065))

(declare-fun m!134067 () Bool)

(assert (=> b!89141 m!134067))

(declare-fun m!134069 () Bool)

(assert (=> b!89141 m!134069))

(declare-fun m!134071 () Bool)

(assert (=> b!89143 m!134071))

(declare-fun m!134073 () Bool)

(assert (=> b!89131 m!134073))

(declare-fun m!134075 () Bool)

(assert (=> b!89134 m!134075))

(declare-fun m!134077 () Bool)

(assert (=> b!89138 m!134077))

(declare-fun m!134079 () Bool)

(assert (=> b!89135 m!134079))

(declare-fun m!134081 () Bool)

(assert (=> b!89130 m!134081))

(assert (=> b!89130 m!134081))

(declare-fun m!134083 () Bool)

(assert (=> b!89130 m!134083))

(declare-fun m!134085 () Bool)

(assert (=> b!89129 m!134085))

(declare-fun m!134087 () Bool)

(assert (=> b!89139 m!134087))

(declare-fun m!134089 () Bool)

(assert (=> b!89133 m!134089))

(declare-fun m!134091 () Bool)

(assert (=> b!89137 m!134091))

(push 1)

(assert (not b!89133))

(assert (not b!89131))

(assert (not b!89138))

(assert (not b!89137))

(assert (not b!89135))

(assert (not b!89141))

(assert (not b!89134))

(assert (not b!89129))

(assert (not b!89130))

(assert (not b!89132))

(assert (not start!18104))

(assert (not b!89143))

(assert (not b!89139))

(check-sat)

(pop 1)

(push 1)

(check-sat)


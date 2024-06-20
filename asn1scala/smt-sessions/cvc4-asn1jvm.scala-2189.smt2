; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55550 () Bool)

(assert start!55550)

(declare-fun b!258680 () Bool)

(declare-fun res!216692 () Bool)

(declare-fun e!179423 () Bool)

(assert (=> b!258680 (=> (not res!216692) (not e!179423))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!258680 (= res!216692 (= from!526 nBits!535))))

(declare-fun b!258679 () Bool)

(declare-fun res!216693 () Bool)

(assert (=> b!258679 (=> (not res!216693) (not e!179423))))

(declare-datatypes ((array!14089 0))(
  ( (array!14090 (arr!7161 (Array (_ BitVec 32) (_ BitVec 8))) (size!6174 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11270 0))(
  ( (BitStream!11271 (buf!6696 array!14089) (currentByte!12301 (_ BitVec 32)) (currentBit!12296 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11270)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258679 (= res!216693 (validate_offset_bits!1 ((_ sign_extend 32) (size!6174 (buf!6696 thiss!1754))) ((_ sign_extend 32) (currentByte!12301 thiss!1754)) ((_ sign_extend 32) (currentBit!12296 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!216694 () Bool)

(assert (=> start!55550 (=> (not res!216694) (not e!179423))))

(assert (=> start!55550 (= res!216694 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55550 e!179423))

(assert (=> start!55550 true))

(declare-fun e!179424 () Bool)

(declare-fun inv!12 (BitStream!11270) Bool)

(assert (=> start!55550 (and (inv!12 thiss!1754) e!179424)))

(declare-fun b!258682 () Bool)

(declare-fun array_inv!5915 (array!14089) Bool)

(assert (=> b!258682 (= e!179424 (array_inv!5915 (buf!6696 thiss!1754)))))

(declare-fun lt!400385 () (_ BitVec 64))

(declare-fun lt!400384 () (_ BitVec 64))

(declare-fun b!258681 () Bool)

(assert (=> b!258681 (= e!179423 (and (= lt!400384 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!400384 (bvand (bvadd lt!400385 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258681 (= lt!400384 (bvand lt!400385 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258681 (= lt!400385 (bitIndex!0 (size!6174 (buf!6696 thiss!1754)) (currentByte!12301 thiss!1754) (currentBit!12296 thiss!1754)))))

(assert (= (and start!55550 res!216694) b!258679))

(assert (= (and b!258679 res!216693) b!258680))

(assert (= (and b!258680 res!216692) b!258681))

(assert (= start!55550 b!258682))

(declare-fun m!388083 () Bool)

(assert (=> b!258679 m!388083))

(declare-fun m!388085 () Bool)

(assert (=> start!55550 m!388085))

(declare-fun m!388087 () Bool)

(assert (=> b!258682 m!388087))

(declare-fun m!388089 () Bool)

(assert (=> b!258681 m!388089))

(push 1)

(assert (not b!258682))

(assert (not b!258681))

(assert (not start!55550))

(assert (not b!258679))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86816 () Bool)

(assert (=> d!86816 (= (array_inv!5915 (buf!6696 thiss!1754)) (bvsge (size!6174 (buf!6696 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258682 d!86816))

(declare-fun d!86818 () Bool)

(declare-fun e!179432 () Bool)

(assert (=> d!86818 e!179432))

(declare-fun res!216707 () Bool)

(assert (=> d!86818 (=> (not res!216707) (not e!179432))))

(declare-fun lt!400423 () (_ BitVec 64))

(declare-fun lt!400427 () (_ BitVec 64))

(declare-fun lt!400426 () (_ BitVec 64))

(assert (=> d!86818 (= res!216707 (= lt!400423 (bvsub lt!400427 lt!400426)))))

(assert (=> d!86818 (or (= (bvand lt!400427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400426 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400427 lt!400426) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86818 (= lt!400426 (remainingBits!0 ((_ sign_extend 32) (size!6174 (buf!6696 thiss!1754))) ((_ sign_extend 32) (currentByte!12301 thiss!1754)) ((_ sign_extend 32) (currentBit!12296 thiss!1754))))))

(declare-fun lt!400422 () (_ BitVec 64))

(declare-fun lt!400424 () (_ BitVec 64))

(assert (=> d!86818 (= lt!400427 (bvmul lt!400422 lt!400424))))

(assert (=> d!86818 (or (= lt!400422 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400424 (bvsdiv (bvmul lt!400422 lt!400424) lt!400422)))))

(assert (=> d!86818 (= lt!400424 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86818 (= lt!400422 ((_ sign_extend 32) (size!6174 (buf!6696 thiss!1754))))))

(assert (=> d!86818 (= lt!400423 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12301 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12296 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86818 (invariant!0 (currentBit!12296 thiss!1754) (currentByte!12301 thiss!1754) (size!6174 (buf!6696 thiss!1754)))))

(assert (=> d!86818 (= (bitIndex!0 (size!6174 (buf!6696 thiss!1754)) (currentByte!12301 thiss!1754) (currentBit!12296 thiss!1754)) lt!400423)))

(declare-fun b!258695 () Bool)

(declare-fun res!216708 () Bool)

(assert (=> b!258695 (=> (not res!216708) (not e!179432))))

(assert (=> b!258695 (= res!216708 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400423))))

(declare-fun b!258696 () Bool)

(declare-fun lt!400425 () (_ BitVec 64))

(assert (=> b!258696 (= e!179432 (bvsle lt!400423 (bvmul lt!400425 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258696 (or (= lt!400425 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400425 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400425)))))

(assert (=> b!258696 (= lt!400425 ((_ sign_extend 32) (size!6174 (buf!6696 thiss!1754))))))

(assert (= (and d!86818 res!216707) b!258695))

(assert (= (and b!258695 res!216708) b!258696))

(declare-fun m!388095 () Bool)

(assert (=> d!86818 m!388095))

(declare-fun m!388097 () Bool)

(assert (=> d!86818 m!388097))

(assert (=> b!258681 d!86818))

(declare-fun d!86820 () Bool)

(assert (=> d!86820 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12296 thiss!1754) (currentByte!12301 thiss!1754) (size!6174 (buf!6696 thiss!1754))))))

(declare-fun bs!21968 () Bool)

(assert (= bs!21968 d!86820))

(assert (=> bs!21968 m!388097))

(assert (=> start!55550 d!86820))

(declare-fun d!86822 () Bool)

(assert (=> d!86822 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6174 (buf!6696 thiss!1754))) ((_ sign_extend 32) (currentByte!12301 thiss!1754)) ((_ sign_extend 32) (currentBit!12296 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6174 (buf!6696 thiss!1754))) ((_ sign_extend 32) (currentByte!12301 thiss!1754)) ((_ sign_extend 32) (currentBit!12296 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21969 () Bool)

(assert (= bs!21969 d!86822))

(assert (=> bs!21969 m!388095))

(assert (=> b!258679 d!86822))

(push 1)

(assert (not d!86818))

(assert (not d!86820))

(assert (not d!86822))

(check-sat)

(pop 1)

(push 1)

(check-sat)


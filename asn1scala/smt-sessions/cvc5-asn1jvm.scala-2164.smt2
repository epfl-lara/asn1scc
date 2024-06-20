; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54916 () Bool)

(assert start!54916)

(declare-fun b!256808 () Bool)

(declare-fun res!215234 () Bool)

(declare-fun e!178020 () Bool)

(assert (=> b!256808 (=> (not res!215234) (not e!178020))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!256808 (= res!215234 (= from!526 nBits!535))))

(declare-fun b!256810 () Bool)

(declare-fun e!178021 () Bool)

(declare-datatypes ((array!13905 0))(
  ( (array!13906 (arr!7087 (Array (_ BitVec 32) (_ BitVec 8))) (size!6100 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11122 0))(
  ( (BitStream!11123 (buf!6622 array!13905) (currentByte!12122 (_ BitVec 32)) (currentBit!12117 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11122)

(declare-fun array_inv!5841 (array!13905) Bool)

(assert (=> b!256810 (= e!178021 (array_inv!5841 (buf!6622 thiss!1754)))))

(declare-fun res!215235 () Bool)

(assert (=> start!54916 (=> (not res!215235) (not e!178020))))

(assert (=> start!54916 (= res!215235 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54916 e!178020))

(assert (=> start!54916 true))

(declare-fun inv!12 (BitStream!11122) Bool)

(assert (=> start!54916 (and (inv!12 thiss!1754) e!178021)))

(declare-fun b!256807 () Bool)

(declare-fun res!215236 () Bool)

(assert (=> b!256807 (=> (not res!215236) (not e!178020))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256807 (= res!215236 (validate_offset_bits!1 ((_ sign_extend 32) (size!6100 (buf!6622 thiss!1754))) ((_ sign_extend 32) (currentByte!12122 thiss!1754)) ((_ sign_extend 32) (currentBit!12117 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256809 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256809 (= e!178020 (not (invariant!0 (currentBit!12117 thiss!1754) (currentByte!12122 thiss!1754) (size!6100 (buf!6622 thiss!1754)))))))

(declare-fun lt!398153 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256809 (= lt!398153 (bitIndex!0 (size!6100 (buf!6622 thiss!1754)) (currentByte!12122 thiss!1754) (currentBit!12117 thiss!1754)))))

(assert (= (and start!54916 res!215235) b!256807))

(assert (= (and b!256807 res!215236) b!256808))

(assert (= (and b!256808 res!215234) b!256809))

(assert (= start!54916 b!256810))

(declare-fun m!386399 () Bool)

(assert (=> b!256810 m!386399))

(declare-fun m!386401 () Bool)

(assert (=> start!54916 m!386401))

(declare-fun m!386403 () Bool)

(assert (=> b!256807 m!386403))

(declare-fun m!386405 () Bool)

(assert (=> b!256809 m!386405))

(declare-fun m!386407 () Bool)

(assert (=> b!256809 m!386407))

(push 1)

(assert (not b!256807))

(assert (not b!256809))

(assert (not start!54916))

(assert (not b!256810))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86160 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86160 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6100 (buf!6622 thiss!1754))) ((_ sign_extend 32) (currentByte!12122 thiss!1754)) ((_ sign_extend 32) (currentBit!12117 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6100 (buf!6622 thiss!1754))) ((_ sign_extend 32) (currentByte!12122 thiss!1754)) ((_ sign_extend 32) (currentBit!12117 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21783 () Bool)

(assert (= bs!21783 d!86160))

(declare-fun m!386429 () Bool)

(assert (=> bs!21783 m!386429))

(assert (=> b!256807 d!86160))

(declare-fun d!86164 () Bool)

(assert (=> d!86164 (= (invariant!0 (currentBit!12117 thiss!1754) (currentByte!12122 thiss!1754) (size!6100 (buf!6622 thiss!1754))) (and (bvsge (currentBit!12117 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12117 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12122 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12122 thiss!1754) (size!6100 (buf!6622 thiss!1754))) (and (= (currentBit!12117 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12122 thiss!1754) (size!6100 (buf!6622 thiss!1754)))))))))

(assert (=> b!256809 d!86164))

(declare-fun d!86166 () Bool)

(declare-fun e!178045 () Bool)

(assert (=> d!86166 e!178045))

(declare-fun res!215266 () Bool)

(assert (=> d!86166 (=> (not res!215266) (not e!178045))))

(declare-fun lt!398190 () (_ BitVec 64))

(declare-fun lt!398193 () (_ BitVec 64))

(declare-fun lt!398195 () (_ BitVec 64))

(assert (=> d!86166 (= res!215266 (= lt!398193 (bvsub lt!398190 lt!398195)))))

(assert (=> d!86166 (or (= (bvand lt!398190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398195 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398190 lt!398195) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86166 (= lt!398195 (remainingBits!0 ((_ sign_extend 32) (size!6100 (buf!6622 thiss!1754))) ((_ sign_extend 32) (currentByte!12122 thiss!1754)) ((_ sign_extend 32) (currentBit!12117 thiss!1754))))))

(declare-fun lt!398192 () (_ BitVec 64))

(declare-fun lt!398194 () (_ BitVec 64))

(assert (=> d!86166 (= lt!398190 (bvmul lt!398192 lt!398194))))

(assert (=> d!86166 (or (= lt!398192 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!398194 (bvsdiv (bvmul lt!398192 lt!398194) lt!398192)))))

(assert (=> d!86166 (= lt!398194 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86166 (= lt!398192 ((_ sign_extend 32) (size!6100 (buf!6622 thiss!1754))))))

(assert (=> d!86166 (= lt!398193 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12122 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12117 thiss!1754))))))

(assert (=> d!86166 (invariant!0 (currentBit!12117 thiss!1754) (currentByte!12122 thiss!1754) (size!6100 (buf!6622 thiss!1754)))))

(assert (=> d!86166 (= (bitIndex!0 (size!6100 (buf!6622 thiss!1754)) (currentByte!12122 thiss!1754) (currentBit!12117 thiss!1754)) lt!398193)))

(declare-fun b!256845 () Bool)

(declare-fun res!215265 () Bool)

(assert (=> b!256845 (=> (not res!215265) (not e!178045))))

(assert (=> b!256845 (= res!215265 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!398193))))

(declare-fun b!256846 () Bool)

(declare-fun lt!398191 () (_ BitVec 64))

(assert (=> b!256846 (= e!178045 (bvsle lt!398193 (bvmul lt!398191 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!256846 (or (= lt!398191 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!398191 #b0000000000000000000000000000000000000000000000000000000000001000) lt!398191)))))

(assert (=> b!256846 (= lt!398191 ((_ sign_extend 32) (size!6100 (buf!6622 thiss!1754))))))

(assert (= (and d!86166 res!215266) b!256845))

(assert (= (and b!256845 res!215265) b!256846))

(assert (=> d!86166 m!386429))

(assert (=> d!86166 m!386405))

(assert (=> b!256809 d!86166))

(declare-fun d!86180 () Bool)

(assert (=> d!86180 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12117 thiss!1754) (currentByte!12122 thiss!1754) (size!6100 (buf!6622 thiss!1754))))))

(declare-fun bs!21786 () Bool)

(assert (= bs!21786 d!86180))

(assert (=> bs!21786 m!386405))

(assert (=> start!54916 d!86180))

(declare-fun d!86184 () Bool)

(assert (=> d!86184 (= (array_inv!5841 (buf!6622 thiss!1754)) (bvsge (size!6100 (buf!6622 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256810 d!86184))

(push 1)

(assert (not d!86166))

(assert (not d!86160))

(assert (not d!86180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48748 () Bool)

(assert start!48748)

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368318 () (_ BitVec 64))

(declare-fun lt!368317 () (_ BitVec 64))

(declare-fun lt!368319 () (_ BitVec 64))

(declare-datatypes ((array!11783 0))(
  ( (array!11784 (arr!6150 (Array (_ BitVec 32) (_ BitVec 8))) (size!5163 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9422 0))(
  ( (BitStream!9423 (buf!5704 array!11783) (currentByte!10696 (_ BitVec 32)) (currentBit!10691 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9422)

(declare-fun e!158543 () Bool)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9422)

(declare-fun b!230782 () Bool)

(assert (=> b!230782 (= e!158543 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5163 (buf!5704 b1!101)))) lt!368317) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14301 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10696 b2!99))) ((_ sign_extend 32) (currentBit!10691 b2!99))))) (and (= lt!368319 bdg!14301) (= (bvsub lt!368319 bits!86) lt!368317) (let ((bdg!14302 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5163 (buf!5704 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14302 (bvsub bdg!14301 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsgt ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14302 bdg!14301) #b0000000000000000000000000000000000000000000000000000000000001000) lt!368318))))))))))

(assert (=> b!230782 (= lt!368317 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10696 b1!101))) ((_ sign_extend 32) (currentBit!10691 b1!101))))))

(declare-fun b!230783 () Bool)

(declare-fun res!193418 () Bool)

(assert (=> b!230783 (=> (not res!193418) (not e!158543))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230783 (= res!193418 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5163 (buf!5704 b1!101))) ((_ sign_extend 32) (currentByte!10696 b1!101)) ((_ sign_extend 32) (currentBit!10691 b1!101)) bytes!19))))

(declare-fun b!230784 () Bool)

(declare-fun e!158542 () Bool)

(declare-fun array_inv!4904 (array!11783) Bool)

(assert (=> b!230784 (= e!158542 (array_inv!4904 (buf!5704 b2!99)))))

(declare-fun b!230785 () Bool)

(declare-fun e!158541 () Bool)

(assert (=> b!230785 (= e!158541 e!158543)))

(declare-fun res!193417 () Bool)

(assert (=> b!230785 (=> (not res!193417) (not e!158543))))

(assert (=> b!230785 (= res!193417 (bvsle ((_ extract 31 0) lt!368318) bytes!19))))

(assert (=> b!230785 (= lt!368318 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun res!193415 () Bool)

(declare-fun e!158545 () Bool)

(assert (=> start!48748 (=> (not res!193415) (not e!158545))))

(assert (=> start!48748 (= res!193415 (and (= (size!5163 (buf!5704 b1!101)) (size!5163 (buf!5704 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48748 e!158545))

(declare-fun e!158546 () Bool)

(declare-fun inv!12 (BitStream!9422) Bool)

(assert (=> start!48748 (and (inv!12 b1!101) e!158546)))

(assert (=> start!48748 (and (inv!12 b2!99) e!158542)))

(assert (=> start!48748 true))

(declare-fun b!230786 () Bool)

(assert (=> b!230786 (= e!158546 (array_inv!4904 (buf!5704 b1!101)))))

(declare-fun b!230787 () Bool)

(declare-fun res!193414 () Bool)

(assert (=> b!230787 (=> (not res!193414) (not e!158543))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230787 (= res!193414 (= lt!368319 (bvadd (bitIndex!0 (size!5163 (buf!5704 b1!101)) (currentByte!10696 b1!101) (currentBit!10691 b1!101)) bits!86)))))

(declare-fun b!230788 () Bool)

(declare-fun res!193419 () Bool)

(assert (=> b!230788 (=> (not res!193419) (not e!158543))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230788 (= res!193419 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5163 (buf!5704 b1!101))) ((_ sign_extend 32) (currentByte!10696 b1!101)) ((_ sign_extend 32) (currentBit!10691 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230789 () Bool)

(assert (=> b!230789 (= e!158545 e!158541)))

(declare-fun res!193416 () Bool)

(assert (=> b!230789 (=> (not res!193416) (not e!158541))))

(assert (=> b!230789 (= res!193416 (bvsle bits!86 lt!368319))))

(assert (=> b!230789 (= lt!368319 (bitIndex!0 (size!5163 (buf!5704 b2!99)) (currentByte!10696 b2!99) (currentBit!10691 b2!99)))))

(assert (= (and start!48748 res!193415) b!230789))

(assert (= (and b!230789 res!193416) b!230785))

(assert (= (and b!230785 res!193417) b!230783))

(assert (= (and b!230783 res!193418) b!230787))

(assert (= (and b!230787 res!193414) b!230788))

(assert (= (and b!230788 res!193419) b!230782))

(assert (= start!48748 b!230786))

(assert (= start!48748 b!230784))

(declare-fun m!354013 () Bool)

(assert (=> b!230789 m!354013))

(declare-fun m!354015 () Bool)

(assert (=> b!230784 m!354015))

(declare-fun m!354017 () Bool)

(assert (=> start!48748 m!354017))

(declare-fun m!354019 () Bool)

(assert (=> start!48748 m!354019))

(declare-fun m!354021 () Bool)

(assert (=> b!230788 m!354021))

(declare-fun m!354023 () Bool)

(assert (=> b!230787 m!354023))

(declare-fun m!354025 () Bool)

(assert (=> b!230783 m!354025))

(declare-fun m!354027 () Bool)

(assert (=> b!230786 m!354027))

(push 1)

(assert (not b!230787))

(assert (not b!230786))

(assert (not start!48748))

(assert (not b!230788))

(assert (not b!230783))

(assert (not b!230789))

(assert (not b!230784))

(check-sat)

(pop 1)

(push 1)

(check-sat)


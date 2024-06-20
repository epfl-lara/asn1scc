; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49048 () Bool)

(assert start!49048)

(declare-fun res!194925 () Bool)

(declare-fun e!160453 () Bool)

(assert (=> start!49048 (=> (not res!194925) (not e!160453))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!12017 0))(
  ( (array!12018 (arr!6261 (Array (_ BitVec 32) (_ BitVec 8))) (size!5274 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9644 0))(
  ( (BitStream!9645 (buf!5815 array!12017) (currentByte!10822 (_ BitVec 32)) (currentBit!10817 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9644)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9644)

(assert (=> start!49048 (= res!194925 (and (= (size!5274 (buf!5815 b1!101)) (size!5274 (buf!5815 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49048 e!160453))

(declare-fun e!160454 () Bool)

(declare-fun inv!12 (BitStream!9644) Bool)

(assert (=> start!49048 (and (inv!12 b1!101) e!160454)))

(declare-fun e!160451 () Bool)

(assert (=> start!49048 (and (inv!12 b2!99) e!160451)))

(assert (=> start!49048 true))

(declare-fun b!232957 () Bool)

(declare-fun res!194927 () Bool)

(declare-fun e!160457 () Bool)

(assert (=> b!232957 (=> (not res!194927) (not e!160457))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232957 (= res!194927 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5274 (buf!5815 b1!101))) ((_ sign_extend 32) (currentByte!10822 b1!101)) ((_ sign_extend 32) (currentBit!10817 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232958 () Bool)

(declare-fun e!160455 () Bool)

(assert (=> b!232958 (= e!160453 e!160455)))

(declare-fun res!194923 () Bool)

(assert (=> b!232958 (=> (not res!194923) (not e!160455))))

(declare-fun lt!369074 () (_ BitVec 64))

(assert (=> b!232958 (= res!194923 (bvsle bits!86 lt!369074))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232958 (= lt!369074 (bitIndex!0 (size!5274 (buf!5815 b2!99)) (currentByte!10822 b2!99) (currentBit!10817 b2!99)))))

(declare-fun b!232959 () Bool)

(declare-fun array_inv!5015 (array!12017) Bool)

(assert (=> b!232959 (= e!160454 (array_inv!5015 (buf!5815 b1!101)))))

(declare-fun b!232960 () Bool)

(declare-fun lt!369073 () (_ BitVec 64))

(declare-fun lt!369075 () (_ BitVec 64))

(assert (=> b!232960 (= e!160457 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5274 (buf!5815 b1!101)))) lt!369073) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14390 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10822 b2!99))) ((_ sign_extend 32) (currentBit!10817 b2!99))))) (and (= lt!369074 bdg!14390) (= (bvsub lt!369074 bits!86) lt!369073) (let ((bdg!14391 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5274 (buf!5815 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14391 (bvsub bdg!14390 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14391 bdg!14390) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369075)) (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (=> b!232960 (= lt!369073 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10822 b1!101))) ((_ sign_extend 32) (currentBit!10817 b1!101))))))

(declare-fun b!232961 () Bool)

(assert (=> b!232961 (= e!160451 (array_inv!5015 (buf!5815 b2!99)))))

(declare-fun b!232962 () Bool)

(declare-fun res!194928 () Bool)

(assert (=> b!232962 (=> (not res!194928) (not e!160457))))

(assert (=> b!232962 (= res!194928 (= lt!369074 (bvadd (bitIndex!0 (size!5274 (buf!5815 b1!101)) (currentByte!10822 b1!101) (currentBit!10817 b1!101)) bits!86)))))

(declare-fun b!232963 () Bool)

(declare-fun res!194926 () Bool)

(assert (=> b!232963 (=> (not res!194926) (not e!160457))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232963 (= res!194926 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5274 (buf!5815 b1!101))) ((_ sign_extend 32) (currentByte!10822 b1!101)) ((_ sign_extend 32) (currentBit!10817 b1!101)) bytes!19))))

(declare-fun b!232964 () Bool)

(assert (=> b!232964 (= e!160455 e!160457)))

(declare-fun res!194924 () Bool)

(assert (=> b!232964 (=> (not res!194924) (not e!160457))))

(assert (=> b!232964 (= res!194924 (bvsle ((_ extract 31 0) lt!369075) bytes!19))))

(assert (=> b!232964 (= lt!369075 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and start!49048 res!194925) b!232958))

(assert (= (and b!232958 res!194923) b!232964))

(assert (= (and b!232964 res!194924) b!232963))

(assert (= (and b!232963 res!194926) b!232962))

(assert (= (and b!232962 res!194928) b!232957))

(assert (= (and b!232957 res!194927) b!232960))

(assert (= start!49048 b!232959))

(assert (= start!49048 b!232961))

(declare-fun m!355711 () Bool)

(assert (=> b!232959 m!355711))

(declare-fun m!355713 () Bool)

(assert (=> b!232958 m!355713))

(declare-fun m!355715 () Bool)

(assert (=> b!232957 m!355715))

(declare-fun m!355717 () Bool)

(assert (=> b!232963 m!355717))

(declare-fun m!355719 () Bool)

(assert (=> b!232962 m!355719))

(declare-fun m!355721 () Bool)

(assert (=> b!232961 m!355721))

(declare-fun m!355723 () Bool)

(assert (=> start!49048 m!355723))

(declare-fun m!355725 () Bool)

(assert (=> start!49048 m!355725))

(push 1)

(assert (not b!232959))

(assert (not start!49048))

(assert (not b!232957))

(assert (not b!232961))

(assert (not b!232958))

(assert (not b!232963))

(assert (not b!232962))

(check-sat)

(pop 1)

(push 1)

(check-sat)


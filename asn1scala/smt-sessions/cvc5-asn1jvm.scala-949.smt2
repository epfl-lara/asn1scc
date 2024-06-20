; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26896 () Bool)

(assert start!26896)

(declare-fun res!115680 () Bool)

(declare-fun e!92293 () Bool)

(assert (=> start!26896 (=> (not res!115680) (not e!92293))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6276 0))(
  ( (array!6277 (arr!3537 (Array (_ BitVec 32) (_ BitVec 8))) (size!2842 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6276)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!26896 (= res!115680 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2842 arr!237))))))

(assert (=> start!26896 e!92293))

(assert (=> start!26896 true))

(declare-fun array_inv!2631 (array!6276) Bool)

(assert (=> start!26896 (array_inv!2631 arr!237)))

(declare-datatypes ((BitStream!4948 0))(
  ( (BitStream!4949 (buf!3255 array!6276) (currentByte!6068 (_ BitVec 32)) (currentBit!6063 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4948)

(declare-fun e!92294 () Bool)

(declare-fun inv!12 (BitStream!4948) Bool)

(assert (=> start!26896 (and (inv!12 thiss!1634) e!92294)))

(declare-fun b!138759 () Bool)

(declare-fun res!115678 () Bool)

(assert (=> b!138759 (=> (not res!115678) (not e!92293))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138759 (= res!115678 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2842 (buf!3255 thiss!1634))) ((_ sign_extend 32) (currentByte!6068 thiss!1634)) ((_ sign_extend 32) (currentBit!6063 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!138761 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138761 (= e!92293 (not (invariant!0 (currentBit!6063 thiss!1634) (currentByte!6068 thiss!1634) (size!2842 (buf!3255 thiss!1634)))))))

(declare-fun isPrefixOf!0 (BitStream!4948 BitStream!4948) Bool)

(assert (=> b!138761 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8640 0))(
  ( (Unit!8641) )
))
(declare-fun lt!216651 () Unit!8640)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4948) Unit!8640)

(assert (=> b!138761 (= lt!216651 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!138762 () Bool)

(assert (=> b!138762 (= e!92294 (array_inv!2631 (buf!3255 thiss!1634)))))

(declare-fun b!138760 () Bool)

(declare-fun res!115679 () Bool)

(assert (=> b!138760 (=> (not res!115679) (not e!92293))))

(assert (=> b!138760 (= res!115679 (bvsge from!447 to!404))))

(assert (= (and start!26896 res!115680) b!138759))

(assert (= (and b!138759 res!115678) b!138760))

(assert (= (and b!138760 res!115679) b!138761))

(assert (= start!26896 b!138762))

(declare-fun m!213671 () Bool)

(assert (=> start!26896 m!213671))

(declare-fun m!213673 () Bool)

(assert (=> start!26896 m!213673))

(declare-fun m!213675 () Bool)

(assert (=> b!138759 m!213675))

(declare-fun m!213677 () Bool)

(assert (=> b!138761 m!213677))

(declare-fun m!213679 () Bool)

(assert (=> b!138761 m!213679))

(declare-fun m!213681 () Bool)

(assert (=> b!138761 m!213681))

(declare-fun m!213683 () Bool)

(assert (=> b!138762 m!213683))

(push 1)

(assert (not b!138762))

(assert (not b!138761))

(assert (not start!26896))

(assert (not b!138759))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!44603 () Bool)

(assert (=> d!44603 (= (array_inv!2631 (buf!3255 thiss!1634)) (bvsge (size!2842 (buf!3255 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!138762 d!44603))

(declare-fun d!44605 () Bool)

(assert (=> d!44605 (= (invariant!0 (currentBit!6063 thiss!1634) (currentByte!6068 thiss!1634) (size!2842 (buf!3255 thiss!1634))) (and (bvsge (currentBit!6063 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6063 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6068 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6068 thiss!1634) (size!2842 (buf!3255 thiss!1634))) (and (= (currentBit!6063 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6068 thiss!1634) (size!2842 (buf!3255 thiss!1634)))))))))

(assert (=> b!138761 d!44605))

(declare-fun d!44607 () Bool)

(declare-fun res!115705 () Bool)

(declare-fun e!92325 () Bool)

(assert (=> d!44607 (=> (not res!115705) (not e!92325))))

(assert (=> d!44607 (= res!115705 (= (size!2842 (buf!3255 thiss!1634)) (size!2842 (buf!3255 thiss!1634))))))

(assert (=> d!44607 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!92325)))

(declare-fun b!138793 () Bool)

(declare-fun res!115706 () Bool)

(assert (=> b!138793 (=> (not res!115706) (not e!92325))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138793 (= res!115706 (bvsle (bitIndex!0 (size!2842 (buf!3255 thiss!1634)) (currentByte!6068 thiss!1634) (currentBit!6063 thiss!1634)) (bitIndex!0 (size!2842 (buf!3255 thiss!1634)) (currentByte!6068 thiss!1634) (currentBit!6063 thiss!1634))))))

(declare-fun b!138794 () Bool)

(declare-fun e!92324 () Bool)

(assert (=> b!138794 (= e!92325 e!92324)))

(declare-fun res!115707 () Bool)

(assert (=> b!138794 (=> res!115707 e!92324)))

(assert (=> b!138794 (= res!115707 (= (size!2842 (buf!3255 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!138795 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6276 array!6276 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!138795 (= e!92324 (arrayBitRangesEq!0 (buf!3255 thiss!1634) (buf!3255 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2842 (buf!3255 thiss!1634)) (currentByte!6068 thiss!1634) (currentBit!6063 thiss!1634))))))

(assert (= (and d!44607 res!115705) b!138793))

(assert (= (and b!138793 res!115706) b!138794))

(assert (= (and b!138794 (not res!115707)) b!138795))

(declare-fun m!213713 () Bool)

(assert (=> b!138793 m!213713))

(assert (=> b!138793 m!213713))

(assert (=> b!138795 m!213713))

(assert (=> b!138795 m!213713))

(declare-fun m!213715 () Bool)

(assert (=> b!138795 m!213715))

(assert (=> b!138761 d!44607))

(declare-fun d!44621 () Bool)

(assert (=> d!44621 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!216660 () Unit!8640)

(declare-fun choose!11 (BitStream!4948) Unit!8640)

(assert (=> d!44621 (= lt!216660 (choose!11 thiss!1634))))

(assert (=> d!44621 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!216660)))

(declare-fun bs!10896 () Bool)

(assert (= bs!10896 d!44621))

(assert (=> bs!10896 m!213679))

(declare-fun m!213717 () Bool)

(assert (=> bs!10896 m!213717))

(assert (=> b!138761 d!44621))

(declare-fun d!44623 () Bool)

(assert (=> d!44623 (= (array_inv!2631 arr!237) (bvsge (size!2842 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26896 d!44623))

(declare-fun d!44625 () Bool)

(assert (=> d!44625 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6063 thiss!1634) (currentByte!6068 thiss!1634) (size!2842 (buf!3255 thiss!1634))))))

(declare-fun bs!10897 () Bool)

(assert (= bs!10897 d!44625))

(assert (=> bs!10897 m!213677))

(assert (=> start!26896 d!44625))

(declare-fun d!44627 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44627 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2842 (buf!3255 thiss!1634))) ((_ sign_extend 32) (currentByte!6068 thiss!1634)) ((_ sign_extend 32) (currentBit!6063 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2842 (buf!3255 thiss!1634))) ((_ sign_extend 32) (currentByte!6068 thiss!1634)) ((_ sign_extend 32) (currentBit!6063 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10898 () Bool)

(assert (= bs!10898 d!44627))

(declare-fun m!213719 () Bool)

(assert (=> bs!10898 m!213719))

(assert (=> b!138759 d!44627))

(push 1)

(assert (not d!44621))

(assert (not d!44625))

(assert (not d!44627))

(assert (not b!138793))

(assert (not b!138795))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


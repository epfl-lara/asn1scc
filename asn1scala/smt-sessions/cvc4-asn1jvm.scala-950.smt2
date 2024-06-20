; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26942 () Bool)

(assert start!26942)

(declare-fun b!138847 () Bool)

(declare-fun res!115751 () Bool)

(declare-fun e!92372 () Bool)

(assert (=> b!138847 (=> (not res!115751) (not e!92372))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!138847 (= res!115751 (bvsge from!447 to!404))))

(declare-fun res!115750 () Bool)

(assert (=> start!26942 (=> (not res!115750) (not e!92372))))

(declare-datatypes ((array!6289 0))(
  ( (array!6290 (arr!3542 (Array (_ BitVec 32) (_ BitVec 8))) (size!2847 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6289)

(assert (=> start!26942 (= res!115750 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2847 arr!237))))))

(assert (=> start!26942 e!92372))

(assert (=> start!26942 true))

(declare-fun array_inv!2636 (array!6289) Bool)

(assert (=> start!26942 (array_inv!2636 arr!237)))

(declare-datatypes ((BitStream!4958 0))(
  ( (BitStream!4959 (buf!3260 array!6289) (currentByte!6079 (_ BitVec 32)) (currentBit!6074 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4958)

(declare-fun e!92373 () Bool)

(declare-fun inv!12 (BitStream!4958) Bool)

(assert (=> start!26942 (and (inv!12 thiss!1634) e!92373)))

(declare-fun b!138846 () Bool)

(declare-fun res!115752 () Bool)

(assert (=> b!138846 (=> (not res!115752) (not e!92372))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138846 (= res!115752 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2847 (buf!3260 thiss!1634))) ((_ sign_extend 32) (currentByte!6079 thiss!1634)) ((_ sign_extend 32) (currentBit!6074 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!138848 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138848 (= e!92372 (not (invariant!0 (currentBit!6074 thiss!1634) (currentByte!6079 thiss!1634) (size!2847 (buf!3260 thiss!1634)))))))

(declare-fun isPrefixOf!0 (BitStream!4958 BitStream!4958) Bool)

(assert (=> b!138848 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8650 0))(
  ( (Unit!8651) )
))
(declare-fun lt!216675 () Unit!8650)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4958) Unit!8650)

(assert (=> b!138848 (= lt!216675 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!138849 () Bool)

(assert (=> b!138849 (= e!92373 (array_inv!2636 (buf!3260 thiss!1634)))))

(assert (= (and start!26942 res!115750) b!138846))

(assert (= (and b!138846 res!115752) b!138847))

(assert (= (and b!138847 res!115751) b!138848))

(assert (= start!26942 b!138849))

(declare-fun m!213765 () Bool)

(assert (=> start!26942 m!213765))

(declare-fun m!213767 () Bool)

(assert (=> start!26942 m!213767))

(declare-fun m!213769 () Bool)

(assert (=> b!138846 m!213769))

(declare-fun m!213771 () Bool)

(assert (=> b!138848 m!213771))

(declare-fun m!213773 () Bool)

(assert (=> b!138848 m!213773))

(declare-fun m!213775 () Bool)

(assert (=> b!138848 m!213775))

(declare-fun m!213777 () Bool)

(assert (=> b!138849 m!213777))

(push 1)

(assert (not start!26942))

(assert (not b!138849))

(assert (not b!138848))

(assert (not b!138846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!44649 () Bool)

(assert (=> d!44649 (= (array_inv!2636 arr!237) (bvsge (size!2847 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26942 d!44649))

(declare-fun d!44653 () Bool)

(assert (=> d!44653 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6074 thiss!1634) (currentByte!6079 thiss!1634) (size!2847 (buf!3260 thiss!1634))))))

(declare-fun bs!10911 () Bool)

(assert (= bs!10911 d!44653))

(assert (=> bs!10911 m!213771))

(assert (=> start!26942 d!44653))

(declare-fun d!44659 () Bool)

(assert (=> d!44659 (= (array_inv!2636 (buf!3260 thiss!1634)) (bvsge (size!2847 (buf!3260 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!138849 d!44659))

(declare-fun d!44661 () Bool)

(assert (=> d!44661 (= (invariant!0 (currentBit!6074 thiss!1634) (currentByte!6079 thiss!1634) (size!2847 (buf!3260 thiss!1634))) (and (bvsge (currentBit!6074 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6074 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6079 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6079 thiss!1634) (size!2847 (buf!3260 thiss!1634))) (and (= (currentBit!6074 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6079 thiss!1634) (size!2847 (buf!3260 thiss!1634)))))))))

(assert (=> b!138848 d!44661))

(declare-fun d!44665 () Bool)

(declare-fun res!115769 () Bool)

(declare-fun e!92384 () Bool)

(assert (=> d!44665 (=> (not res!115769) (not e!92384))))

(assert (=> d!44665 (= res!115769 (= (size!2847 (buf!3260 thiss!1634)) (size!2847 (buf!3260 thiss!1634))))))

(assert (=> d!44665 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!92384)))

(declare-fun b!138862 () Bool)

(declare-fun res!115767 () Bool)

(assert (=> b!138862 (=> (not res!115767) (not e!92384))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138862 (= res!115767 (bvsle (bitIndex!0 (size!2847 (buf!3260 thiss!1634)) (currentByte!6079 thiss!1634) (currentBit!6074 thiss!1634)) (bitIndex!0 (size!2847 (buf!3260 thiss!1634)) (currentByte!6079 thiss!1634) (currentBit!6074 thiss!1634))))))

(declare-fun b!138864 () Bool)

(declare-fun e!92383 () Bool)

(assert (=> b!138864 (= e!92384 e!92383)))

(declare-fun res!115765 () Bool)

(assert (=> b!138864 (=> res!115765 e!92383)))

(assert (=> b!138864 (= res!115765 (= (size!2847 (buf!3260 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!138866 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6289 array!6289 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!138866 (= e!92383 (arrayBitRangesEq!0 (buf!3260 thiss!1634) (buf!3260 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2847 (buf!3260 thiss!1634)) (currentByte!6079 thiss!1634) (currentBit!6074 thiss!1634))))))

(assert (= (and d!44665 res!115769) b!138862))

(assert (= (and b!138862 res!115767) b!138864))

(assert (= (and b!138864 (not res!115765)) b!138866))

(declare-fun m!213781 () Bool)

(assert (=> b!138862 m!213781))

(assert (=> b!138862 m!213781))

(assert (=> b!138866 m!213781))

(assert (=> b!138866 m!213781))

(declare-fun m!213783 () Bool)

(assert (=> b!138866 m!213783))

(assert (=> b!138848 d!44665))

(declare-fun d!44671 () Bool)

(assert (=> d!44671 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!216680 () Unit!8650)

(declare-fun choose!11 (BitStream!4958) Unit!8650)

(assert (=> d!44671 (= lt!216680 (choose!11 thiss!1634))))

(assert (=> d!44671 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!216680)))

(declare-fun bs!10915 () Bool)

(assert (= bs!10915 d!44671))

(assert (=> bs!10915 m!213773))

(declare-fun m!213789 () Bool)

(assert (=> bs!10915 m!213789))

(assert (=> b!138848 d!44671))

(declare-fun d!44681 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44681 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2847 (buf!3260 thiss!1634))) ((_ sign_extend 32) (currentByte!6079 thiss!1634)) ((_ sign_extend 32) (currentBit!6074 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2847 (buf!3260 thiss!1634))) ((_ sign_extend 32) (currentByte!6079 thiss!1634)) ((_ sign_extend 32) (currentBit!6074 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10917 () Bool)

(assert (= bs!10917 d!44681))

(declare-fun m!213791 () Bool)

(assert (=> bs!10917 m!213791))

(assert (=> b!138846 d!44681))

(push 1)


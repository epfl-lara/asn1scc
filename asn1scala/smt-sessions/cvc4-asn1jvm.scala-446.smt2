; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11872 () Bool)

(assert start!11872)

(declare-fun b!59916 () Bool)

(declare-fun e!39923 () Bool)

(declare-fun e!39924 () Bool)

(assert (=> b!59916 (= e!39923 e!39924)))

(declare-fun res!49913 () Bool)

(assert (=> b!59916 (=> res!49913 e!39924)))

(declare-datatypes ((array!2729 0))(
  ( (array!2730 (arr!1804 (Array (_ BitVec 32) (_ BitVec 8))) (size!1240 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2168 0))(
  ( (BitStream!2169 (buf!1621 array!2729) (currentByte!3239 (_ BitVec 32)) (currentBit!3234 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4103 0))(
  ( (Unit!4104) )
))
(declare-datatypes ((tuple2!5458 0))(
  ( (tuple2!5459 (_1!2840 Unit!4103) (_2!2840 BitStream!2168)) )
))
(declare-fun lt!93730 () tuple2!5458)

(declare-fun lt!93735 () tuple2!5458)

(assert (=> b!59916 (= res!49913 (not (= (size!1240 (buf!1621 (_2!2840 lt!93730))) (size!1240 (buf!1621 (_2!2840 lt!93735))))))))

(declare-fun e!39927 () Bool)

(assert (=> b!59916 e!39927))

(declare-fun res!49919 () Bool)

(assert (=> b!59916 (=> (not res!49919) (not e!39927))))

(declare-fun thiss!1379 () BitStream!2168)

(assert (=> b!59916 (= res!49919 (= (size!1240 (buf!1621 (_2!2840 lt!93735))) (size!1240 (buf!1621 thiss!1379))))))

(declare-fun srcBuffer!2 () array!2729)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!5460 0))(
  ( (tuple2!5461 (_1!2841 BitStream!2168) (_2!2841 BitStream!2168)) )
))
(declare-fun lt!93736 () tuple2!5460)

(declare-fun e!39920 () Bool)

(declare-fun b!59917 () Bool)

(declare-datatypes ((List!659 0))(
  ( (Nil!656) (Cons!655 (h!774 Bool) (t!1409 List!659)) )
))
(declare-fun head!478 (List!659) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2168 array!2729 (_ BitVec 64) (_ BitVec 64)) List!659)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2168 BitStream!2168 (_ BitVec 64)) List!659)

(assert (=> b!59917 (= e!39920 (= (head!478 (byteArrayBitContentToList!0 (_2!2840 lt!93730) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!478 (bitStreamReadBitsIntoList!0 (_2!2840 lt!93730) (_1!2841 lt!93736) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59918 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!59918 (= e!39924 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!93740 () tuple2!5460)

(declare-fun lt!93742 () List!659)

(assert (=> b!59918 (= lt!93742 (bitStreamReadBitsIntoList!0 (_2!2840 lt!93735) (_1!2841 lt!93740) (bvsub to!314 i!635)))))

(declare-fun lt!93733 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59918 (validate_offset_bits!1 ((_ sign_extend 32) (size!1240 (buf!1621 (_2!2840 lt!93735)))) ((_ sign_extend 32) (currentByte!3239 (_2!2840 lt!93730))) ((_ sign_extend 32) (currentBit!3234 (_2!2840 lt!93730))) lt!93733)))

(declare-fun lt!93728 () Unit!4103)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2168 array!2729 (_ BitVec 64)) Unit!4103)

(assert (=> b!59918 (= lt!93728 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2840 lt!93730) (buf!1621 (_2!2840 lt!93735)) lt!93733))))

(declare-fun lt!93739 () tuple2!5460)

(declare-fun reader!0 (BitStream!2168 BitStream!2168) tuple2!5460)

(assert (=> b!59918 (= lt!93739 (reader!0 (_2!2840 lt!93730) (_2!2840 lt!93735)))))

(assert (=> b!59918 (validate_offset_bits!1 ((_ sign_extend 32) (size!1240 (buf!1621 (_2!2840 lt!93735)))) ((_ sign_extend 32) (currentByte!3239 thiss!1379)) ((_ sign_extend 32) (currentBit!3234 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93729 () Unit!4103)

(assert (=> b!59918 (= lt!93729 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1621 (_2!2840 lt!93735)) (bvsub to!314 i!635)))))

(assert (=> b!59918 (= lt!93740 (reader!0 thiss!1379 (_2!2840 lt!93735)))))

(declare-fun b!59919 () Bool)

(declare-fun res!49916 () Bool)

(assert (=> b!59919 (=> res!49916 e!39924)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59919 (= res!49916 (not (invariant!0 (currentBit!3234 (_2!2840 lt!93730)) (currentByte!3239 (_2!2840 lt!93730)) (size!1240 (buf!1621 (_2!2840 lt!93730))))))))

(declare-fun res!49911 () Bool)

(declare-fun e!39926 () Bool)

(assert (=> start!11872 (=> (not res!49911) (not e!39926))))

(assert (=> start!11872 (= res!49911 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1240 srcBuffer!2))))))))

(assert (=> start!11872 e!39926))

(assert (=> start!11872 true))

(declare-fun array_inv!1143 (array!2729) Bool)

(assert (=> start!11872 (array_inv!1143 srcBuffer!2)))

(declare-fun e!39925 () Bool)

(declare-fun inv!12 (BitStream!2168) Bool)

(assert (=> start!11872 (and (inv!12 thiss!1379) e!39925)))

(declare-fun b!59920 () Bool)

(declare-fun res!49920 () Bool)

(assert (=> b!59920 (=> res!49920 e!39923)))

(assert (=> b!59920 (= res!49920 (not (invariant!0 (currentBit!3234 (_2!2840 lt!93735)) (currentByte!3239 (_2!2840 lt!93735)) (size!1240 (buf!1621 (_2!2840 lt!93735))))))))

(declare-fun b!59921 () Bool)

(declare-fun res!49909 () Bool)

(assert (=> b!59921 (=> res!49909 e!39923)))

(assert (=> b!59921 (= res!49909 (not (= (size!1240 (buf!1621 thiss!1379)) (size!1240 (buf!1621 (_2!2840 lt!93735))))))))

(declare-fun b!59922 () Bool)

(assert (=> b!59922 (= e!39925 (array_inv!1143 (buf!1621 thiss!1379)))))

(declare-fun b!59923 () Bool)

(declare-fun e!39928 () Bool)

(assert (=> b!59923 (= e!39928 e!39923)))

(declare-fun res!49914 () Bool)

(assert (=> b!59923 (=> res!49914 e!39923)))

(declare-fun lt!93734 () (_ BitVec 64))

(declare-fun lt!93731 () (_ BitVec 64))

(assert (=> b!59923 (= res!49914 (not (= lt!93731 (bvsub (bvadd lt!93734 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59923 (= lt!93731 (bitIndex!0 (size!1240 (buf!1621 (_2!2840 lt!93735))) (currentByte!3239 (_2!2840 lt!93735)) (currentBit!3234 (_2!2840 lt!93735))))))

(declare-fun b!59924 () Bool)

(declare-fun e!39919 () Bool)

(assert (=> b!59924 (= e!39919 e!39928)))

(declare-fun res!49917 () Bool)

(assert (=> b!59924 (=> res!49917 e!39928)))

(declare-fun isPrefixOf!0 (BitStream!2168 BitStream!2168) Bool)

(assert (=> b!59924 (= res!49917 (not (isPrefixOf!0 (_2!2840 lt!93730) (_2!2840 lt!93735))))))

(assert (=> b!59924 (isPrefixOf!0 thiss!1379 (_2!2840 lt!93735))))

(declare-fun lt!93738 () Unit!4103)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2168 BitStream!2168 BitStream!2168) Unit!4103)

(assert (=> b!59924 (= lt!93738 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2840 lt!93730) (_2!2840 lt!93735)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2168 array!2729 (_ BitVec 64) (_ BitVec 64)) tuple2!5458)

(assert (=> b!59924 (= lt!93735 (appendBitsMSBFirstLoop!0 (_2!2840 lt!93730) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!59924 e!39920))

(declare-fun res!49912 () Bool)

(assert (=> b!59924 (=> (not res!49912) (not e!39920))))

(assert (=> b!59924 (= res!49912 (validate_offset_bits!1 ((_ sign_extend 32) (size!1240 (buf!1621 (_2!2840 lt!93730)))) ((_ sign_extend 32) (currentByte!3239 thiss!1379)) ((_ sign_extend 32) (currentBit!3234 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93741 () Unit!4103)

(assert (=> b!59924 (= lt!93741 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1621 (_2!2840 lt!93730)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!59924 (= lt!93736 (reader!0 thiss!1379 (_2!2840 lt!93730)))))

(declare-fun b!59925 () Bool)

(declare-fun res!49910 () Bool)

(assert (=> b!59925 (=> (not res!49910) (not e!39926))))

(assert (=> b!59925 (= res!49910 (validate_offset_bits!1 ((_ sign_extend 32) (size!1240 (buf!1621 thiss!1379))) ((_ sign_extend 32) (currentByte!3239 thiss!1379)) ((_ sign_extend 32) (currentBit!3234 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59926 () Bool)

(declare-fun e!39922 () Bool)

(assert (=> b!59926 (= e!39926 (not e!39922))))

(declare-fun res!49915 () Bool)

(assert (=> b!59926 (=> res!49915 e!39922)))

(assert (=> b!59926 (= res!49915 (bvsge i!635 to!314))))

(assert (=> b!59926 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93737 () Unit!4103)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2168) Unit!4103)

(assert (=> b!59926 (= lt!93737 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!59926 (= lt!93734 (bitIndex!0 (size!1240 (buf!1621 thiss!1379)) (currentByte!3239 thiss!1379) (currentBit!3234 thiss!1379)))))

(declare-fun b!59927 () Bool)

(declare-fun res!49908 () Bool)

(assert (=> b!59927 (=> res!49908 e!39924)))

(assert (=> b!59927 (= res!49908 (not (invariant!0 (currentBit!3234 (_2!2840 lt!93730)) (currentByte!3239 (_2!2840 lt!93730)) (size!1240 (buf!1621 (_2!2840 lt!93735))))))))

(declare-fun b!59928 () Bool)

(assert (=> b!59928 (= e!39922 e!39919)))

(declare-fun res!49918 () Bool)

(assert (=> b!59928 (=> res!49918 e!39919)))

(assert (=> b!59928 (= res!49918 (not (isPrefixOf!0 thiss!1379 (_2!2840 lt!93730))))))

(assert (=> b!59928 (validate_offset_bits!1 ((_ sign_extend 32) (size!1240 (buf!1621 (_2!2840 lt!93730)))) ((_ sign_extend 32) (currentByte!3239 (_2!2840 lt!93730))) ((_ sign_extend 32) (currentBit!3234 (_2!2840 lt!93730))) lt!93733)))

(assert (=> b!59928 (= lt!93733 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93732 () Unit!4103)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2168 BitStream!2168 (_ BitVec 64) (_ BitVec 64)) Unit!4103)

(assert (=> b!59928 (= lt!93732 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2840 lt!93730) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2168 (_ BitVec 8) (_ BitVec 32)) tuple2!5458)

(assert (=> b!59928 (= lt!93730 (appendBitFromByte!0 thiss!1379 (select (arr!1804 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59929 () Bool)

(assert (=> b!59929 (= e!39927 (= lt!93731 (bvsub (bvsub (bvadd (bitIndex!0 (size!1240 (buf!1621 (_2!2840 lt!93730))) (currentByte!3239 (_2!2840 lt!93730)) (currentBit!3234 (_2!2840 lt!93730))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!11872 res!49911) b!59925))

(assert (= (and b!59925 res!49910) b!59926))

(assert (= (and b!59926 (not res!49915)) b!59928))

(assert (= (and b!59928 (not res!49918)) b!59924))

(assert (= (and b!59924 res!49912) b!59917))

(assert (= (and b!59924 (not res!49917)) b!59923))

(assert (= (and b!59923 (not res!49914)) b!59920))

(assert (= (and b!59920 (not res!49920)) b!59921))

(assert (= (and b!59921 (not res!49909)) b!59916))

(assert (= (and b!59916 res!49919) b!59929))

(assert (= (and b!59916 (not res!49913)) b!59919))

(assert (= (and b!59919 (not res!49916)) b!59927))

(assert (= (and b!59927 (not res!49908)) b!59918))

(assert (= start!11872 b!59922))

(declare-fun m!94377 () Bool)

(assert (=> b!59925 m!94377))

(declare-fun m!94379 () Bool)

(assert (=> b!59922 m!94379))

(declare-fun m!94381 () Bool)

(assert (=> b!59918 m!94381))

(declare-fun m!94383 () Bool)

(assert (=> b!59918 m!94383))

(declare-fun m!94385 () Bool)

(assert (=> b!59918 m!94385))

(declare-fun m!94387 () Bool)

(assert (=> b!59918 m!94387))

(declare-fun m!94389 () Bool)

(assert (=> b!59918 m!94389))

(declare-fun m!94391 () Bool)

(assert (=> b!59918 m!94391))

(declare-fun m!94393 () Bool)

(assert (=> b!59918 m!94393))

(declare-fun m!94395 () Bool)

(assert (=> b!59929 m!94395))

(declare-fun m!94397 () Bool)

(assert (=> b!59920 m!94397))

(declare-fun m!94399 () Bool)

(assert (=> b!59926 m!94399))

(declare-fun m!94401 () Bool)

(assert (=> b!59926 m!94401))

(declare-fun m!94403 () Bool)

(assert (=> b!59926 m!94403))

(declare-fun m!94405 () Bool)

(assert (=> start!11872 m!94405))

(declare-fun m!94407 () Bool)

(assert (=> start!11872 m!94407))

(declare-fun m!94409 () Bool)

(assert (=> b!59924 m!94409))

(declare-fun m!94411 () Bool)

(assert (=> b!59924 m!94411))

(declare-fun m!94413 () Bool)

(assert (=> b!59924 m!94413))

(declare-fun m!94415 () Bool)

(assert (=> b!59924 m!94415))

(declare-fun m!94417 () Bool)

(assert (=> b!59924 m!94417))

(declare-fun m!94419 () Bool)

(assert (=> b!59924 m!94419))

(declare-fun m!94421 () Bool)

(assert (=> b!59924 m!94421))

(declare-fun m!94423 () Bool)

(assert (=> b!59917 m!94423))

(assert (=> b!59917 m!94423))

(declare-fun m!94425 () Bool)

(assert (=> b!59917 m!94425))

(declare-fun m!94427 () Bool)

(assert (=> b!59917 m!94427))

(assert (=> b!59917 m!94427))

(declare-fun m!94429 () Bool)

(assert (=> b!59917 m!94429))

(declare-fun m!94431 () Bool)

(assert (=> b!59919 m!94431))

(declare-fun m!94433 () Bool)

(assert (=> b!59923 m!94433))

(declare-fun m!94435 () Bool)

(assert (=> b!59927 m!94435))

(declare-fun m!94437 () Bool)

(assert (=> b!59928 m!94437))

(declare-fun m!94439 () Bool)

(assert (=> b!59928 m!94439))

(declare-fun m!94441 () Bool)

(assert (=> b!59928 m!94441))

(assert (=> b!59928 m!94439))

(declare-fun m!94443 () Bool)

(assert (=> b!59928 m!94443))

(declare-fun m!94445 () Bool)

(assert (=> b!59928 m!94445))

(push 1)

(assert (not start!11872))

(assert (not b!59922))

(assert (not b!59919))

(assert (not b!59926))

(assert (not b!59923))

(assert (not b!59927))

(assert (not b!59925))

(assert (not b!59918))

(assert (not b!59924))

(assert (not b!59920))

(assert (not b!59929))

(assert (not b!59928))

(assert (not b!59917))

(check-sat)

(pop 1)

(push 1)

(check-sat)


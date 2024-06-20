; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28024 () Bool)

(assert start!28024)

(declare-fun b!145340 () Bool)

(declare-fun res!121534 () Bool)

(declare-fun e!96909 () Bool)

(assert (=> b!145340 (=> (not res!121534) (not e!96909))))

(declare-datatypes ((array!6616 0))(
  ( (array!6617 (arr!3729 (Array (_ BitVec 32) (_ BitVec 8))) (size!2996 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5250 0))(
  ( (BitStream!5251 (buf!3435 array!6616) (currentByte!6325 (_ BitVec 32)) (currentBit!6320 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5250)

(declare-datatypes ((Unit!9065 0))(
  ( (Unit!9066) )
))
(declare-datatypes ((tuple2!13010 0))(
  ( (tuple2!13011 (_1!6851 Unit!9065) (_2!6851 BitStream!5250)) )
))
(declare-fun lt!225135 () tuple2!13010)

(declare-fun isPrefixOf!0 (BitStream!5250 BitStream!5250) Bool)

(assert (=> b!145340 (= res!121534 (isPrefixOf!0 thiss!1634 (_2!6851 lt!225135)))))

(declare-fun b!145341 () Bool)

(declare-fun res!121533 () Bool)

(declare-fun e!96900 () Bool)

(assert (=> b!145341 (=> (not res!121533) (not e!96900))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145341 (= res!121533 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2996 (buf!3435 thiss!1634))) ((_ sign_extend 32) (currentByte!6325 thiss!1634)) ((_ sign_extend 32) (currentBit!6320 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!145342 () Bool)

(declare-fun e!96903 () Bool)

(declare-fun array_inv!2785 (array!6616) Bool)

(assert (=> b!145342 (= e!96903 (array_inv!2785 (buf!3435 thiss!1634)))))

(declare-fun b!145343 () Bool)

(declare-fun e!96899 () Bool)

(declare-datatypes ((tuple2!13012 0))(
  ( (tuple2!13013 (_1!6852 BitStream!5250) (_2!6852 (_ BitVec 8))) )
))
(declare-fun lt!225133 () tuple2!13012)

(declare-fun lt!225144 () tuple2!13012)

(assert (=> b!145343 (= e!96899 (= (_2!6852 lt!225133) (_2!6852 lt!225144)))))

(declare-fun b!145344 () Bool)

(declare-fun e!96901 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145344 (= e!96901 (invariant!0 (currentBit!6320 thiss!1634) (currentByte!6325 thiss!1634) (size!2996 (buf!3435 (_2!6851 lt!225135)))))))

(declare-fun b!145345 () Bool)

(declare-fun res!121525 () Bool)

(assert (=> b!145345 (=> (not res!121525) (not e!96909))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145345 (= res!121525 (= (bitIndex!0 (size!2996 (buf!3435 (_2!6851 lt!225135))) (currentByte!6325 (_2!6851 lt!225135)) (currentBit!6320 (_2!6851 lt!225135))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2996 (buf!3435 thiss!1634)) (currentByte!6325 thiss!1634) (currentBit!6320 thiss!1634)))))))

(declare-fun b!145346 () Bool)

(declare-fun arr!237 () array!6616)

(declare-datatypes ((tuple2!13014 0))(
  ( (tuple2!13015 (_1!6853 BitStream!5250) (_2!6853 BitStream!5250)) )
))
(declare-fun lt!225141 () tuple2!13014)

(declare-fun lt!225139 () tuple2!13012)

(assert (=> b!145346 (= e!96909 (and (= (_2!6852 lt!225139) (select (arr!3729 arr!237) from!447)) (= (_1!6852 lt!225139) (_2!6853 lt!225141))))))

(declare-fun readBytePure!0 (BitStream!5250) tuple2!13012)

(assert (=> b!145346 (= lt!225139 (readBytePure!0 (_1!6853 lt!225141)))))

(declare-fun reader!0 (BitStream!5250 BitStream!5250) tuple2!13014)

(assert (=> b!145346 (= lt!225141 (reader!0 thiss!1634 (_2!6851 lt!225135)))))

(declare-fun b!145347 () Bool)

(declare-datatypes ((tuple2!13016 0))(
  ( (tuple2!13017 (_1!6854 BitStream!5250) (_2!6854 array!6616)) )
))
(declare-fun lt!225134 () tuple2!13016)

(declare-fun e!96907 () Bool)

(declare-fun arrayRangesEq!312 (array!6616 array!6616 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145347 (= e!96907 (not (arrayRangesEq!312 arr!237 (_2!6854 lt!225134) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!145348 () Bool)

(declare-fun res!121530 () Bool)

(assert (=> b!145348 (=> (not res!121530) (not e!96900))))

(assert (=> b!145348 (= res!121530 (invariant!0 (currentBit!6320 thiss!1634) (currentByte!6325 thiss!1634) (size!2996 (buf!3435 thiss!1634))))))

(declare-fun res!121523 () Bool)

(assert (=> start!28024 (=> (not res!121523) (not e!96900))))

(assert (=> start!28024 (= res!121523 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2996 arr!237))))))

(assert (=> start!28024 e!96900))

(assert (=> start!28024 true))

(assert (=> start!28024 (array_inv!2785 arr!237)))

(declare-fun inv!12 (BitStream!5250) Bool)

(assert (=> start!28024 (and (inv!12 thiss!1634) e!96903)))

(declare-fun b!145349 () Bool)

(assert (=> b!145349 (= e!96900 (not true))))

(declare-fun lt!225136 () tuple2!13014)

(declare-fun lt!225137 () tuple2!13012)

(declare-fun lt!225129 () tuple2!13016)

(declare-fun readByteArrayLoopPure!0 (BitStream!5250 array!6616 (_ BitVec 32) (_ BitVec 32)) tuple2!13016)

(assert (=> b!145349 (= lt!225129 (readByteArrayLoopPure!0 (_1!6853 lt!225136) (array!6617 (store (arr!3729 arr!237) from!447 (_2!6852 lt!225137)) (size!2996 arr!237)) (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!225125 () tuple2!13010)

(declare-fun lt!225142 () (_ BitVec 32))

(assert (=> b!145349 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2996 (buf!3435 (_2!6851 lt!225125)))) ((_ sign_extend 32) (currentByte!6325 (_2!6851 lt!225135))) ((_ sign_extend 32) (currentBit!6320 (_2!6851 lt!225135))) lt!225142)))

(declare-fun lt!225128 () Unit!9065)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5250 array!6616 (_ BitVec 32)) Unit!9065)

(assert (=> b!145349 (= lt!225128 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6851 lt!225135) (buf!3435 (_2!6851 lt!225125)) lt!225142))))

(declare-fun e!96905 () Bool)

(assert (=> b!145349 e!96905))

(declare-fun res!121522 () Bool)

(assert (=> b!145349 (=> (not res!121522) (not e!96905))))

(assert (=> b!145349 (= res!121522 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2996 (buf!3435 (_2!6851 lt!225125)))) ((_ sign_extend 32) (currentByte!6325 thiss!1634)) ((_ sign_extend 32) (currentBit!6320 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!225124 () Unit!9065)

(assert (=> b!145349 (= lt!225124 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3435 (_2!6851 lt!225125)) (bvsub to!404 from!447)))))

(assert (=> b!145349 (= (_2!6852 lt!225137) (select (arr!3729 arr!237) from!447))))

(declare-fun lt!225138 () tuple2!13014)

(assert (=> b!145349 (= lt!225137 (readBytePure!0 (_1!6853 lt!225138)))))

(assert (=> b!145349 (= lt!225136 (reader!0 (_2!6851 lt!225135) (_2!6851 lt!225125)))))

(assert (=> b!145349 (= lt!225138 (reader!0 thiss!1634 (_2!6851 lt!225125)))))

(assert (=> b!145349 e!96899))

(declare-fun res!121532 () Bool)

(assert (=> b!145349 (=> (not res!121532) (not e!96899))))

(assert (=> b!145349 (= res!121532 (= (bitIndex!0 (size!2996 (buf!3435 (_1!6852 lt!225133))) (currentByte!6325 (_1!6852 lt!225133)) (currentBit!6320 (_1!6852 lt!225133))) (bitIndex!0 (size!2996 (buf!3435 (_1!6852 lt!225144))) (currentByte!6325 (_1!6852 lt!225144)) (currentBit!6320 (_1!6852 lt!225144)))))))

(declare-fun lt!225140 () Unit!9065)

(declare-fun lt!225132 () BitStream!5250)

(declare-fun readBytePrefixLemma!0 (BitStream!5250 BitStream!5250) Unit!9065)

(assert (=> b!145349 (= lt!225140 (readBytePrefixLemma!0 lt!225132 (_2!6851 lt!225125)))))

(assert (=> b!145349 (= lt!225144 (readBytePure!0 (BitStream!5251 (buf!3435 (_2!6851 lt!225125)) (currentByte!6325 thiss!1634) (currentBit!6320 thiss!1634))))))

(assert (=> b!145349 (= lt!225133 (readBytePure!0 lt!225132))))

(assert (=> b!145349 (= lt!225132 (BitStream!5251 (buf!3435 (_2!6851 lt!225135)) (currentByte!6325 thiss!1634) (currentBit!6320 thiss!1634)))))

(assert (=> b!145349 e!96901))

(declare-fun res!121531 () Bool)

(assert (=> b!145349 (=> (not res!121531) (not e!96901))))

(assert (=> b!145349 (= res!121531 (isPrefixOf!0 thiss!1634 (_2!6851 lt!225125)))))

(declare-fun lt!225127 () Unit!9065)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5250 BitStream!5250 BitStream!5250) Unit!9065)

(assert (=> b!145349 (= lt!225127 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6851 lt!225135) (_2!6851 lt!225125)))))

(declare-fun e!96906 () Bool)

(assert (=> b!145349 e!96906))

(declare-fun res!121528 () Bool)

(assert (=> b!145349 (=> (not res!121528) (not e!96906))))

(assert (=> b!145349 (= res!121528 (= (size!2996 (buf!3435 (_2!6851 lt!225135))) (size!2996 (buf!3435 (_2!6851 lt!225125)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5250 array!6616 (_ BitVec 32) (_ BitVec 32)) tuple2!13010)

(assert (=> b!145349 (= lt!225125 (appendByteArrayLoop!0 (_2!6851 lt!225135) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145349 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2996 (buf!3435 (_2!6851 lt!225135)))) ((_ sign_extend 32) (currentByte!6325 (_2!6851 lt!225135))) ((_ sign_extend 32) (currentBit!6320 (_2!6851 lt!225135))) lt!225142)))

(assert (=> b!145349 (= lt!225142 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!225131 () Unit!9065)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5250 BitStream!5250 (_ BitVec 64) (_ BitVec 32)) Unit!9065)

(assert (=> b!145349 (= lt!225131 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6851 lt!225135) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!145349 e!96909))

(declare-fun res!121521 () Bool)

(assert (=> b!145349 (=> (not res!121521) (not e!96909))))

(assert (=> b!145349 (= res!121521 (= (size!2996 (buf!3435 thiss!1634)) (size!2996 (buf!3435 (_2!6851 lt!225135)))))))

(declare-fun appendByte!0 (BitStream!5250 (_ BitVec 8)) tuple2!13010)

(assert (=> b!145349 (= lt!225135 (appendByte!0 thiss!1634 (select (arr!3729 arr!237) from!447)))))

(declare-fun b!145350 () Bool)

(declare-fun e!96908 () Bool)

(assert (=> b!145350 (= e!96906 e!96908)))

(declare-fun res!121529 () Bool)

(assert (=> b!145350 (=> (not res!121529) (not e!96908))))

(declare-fun lt!225130 () (_ BitVec 64))

(assert (=> b!145350 (= res!121529 (= (bitIndex!0 (size!2996 (buf!3435 (_2!6851 lt!225125))) (currentByte!6325 (_2!6851 lt!225125)) (currentBit!6320 (_2!6851 lt!225125))) (bvadd (bitIndex!0 (size!2996 (buf!3435 (_2!6851 lt!225135))) (currentByte!6325 (_2!6851 lt!225135)) (currentBit!6320 (_2!6851 lt!225135))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!225130))))))

(assert (=> b!145350 (= lt!225130 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!145351 () Bool)

(declare-fun res!121524 () Bool)

(assert (=> b!145351 (=> (not res!121524) (not e!96908))))

(assert (=> b!145351 (= res!121524 (isPrefixOf!0 (_2!6851 lt!225135) (_2!6851 lt!225125)))))

(declare-fun b!145352 () Bool)

(declare-fun res!121526 () Bool)

(assert (=> b!145352 (=> (not res!121526) (not e!96900))))

(assert (=> b!145352 (= res!121526 (bvslt from!447 to!404))))

(declare-fun b!145353 () Bool)

(assert (=> b!145353 (= e!96908 (not e!96907))))

(declare-fun res!121527 () Bool)

(assert (=> b!145353 (=> res!121527 e!96907)))

(declare-fun lt!225143 () tuple2!13014)

(assert (=> b!145353 (= res!121527 (or (not (= (size!2996 (_2!6854 lt!225134)) (size!2996 arr!237))) (not (= (_1!6854 lt!225134) (_2!6853 lt!225143)))))))

(assert (=> b!145353 (= lt!225134 (readByteArrayLoopPure!0 (_1!6853 lt!225143) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145353 (validate_offset_bits!1 ((_ sign_extend 32) (size!2996 (buf!3435 (_2!6851 lt!225125)))) ((_ sign_extend 32) (currentByte!6325 (_2!6851 lt!225135))) ((_ sign_extend 32) (currentBit!6320 (_2!6851 lt!225135))) lt!225130)))

(declare-fun lt!225126 () Unit!9065)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5250 array!6616 (_ BitVec 64)) Unit!9065)

(assert (=> b!145353 (= lt!225126 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6851 lt!225135) (buf!3435 (_2!6851 lt!225125)) lt!225130))))

(assert (=> b!145353 (= lt!225143 (reader!0 (_2!6851 lt!225135) (_2!6851 lt!225125)))))

(declare-fun b!145354 () Bool)

(assert (=> b!145354 (= e!96905 (= (_1!6854 (readByteArrayLoopPure!0 (_1!6853 lt!225138) arr!237 from!447 to!404)) (_2!6853 lt!225138)))))

(assert (= (and start!28024 res!121523) b!145341))

(assert (= (and b!145341 res!121533) b!145352))

(assert (= (and b!145352 res!121526) b!145348))

(assert (= (and b!145348 res!121530) b!145349))

(assert (= (and b!145349 res!121521) b!145345))

(assert (= (and b!145345 res!121525) b!145340))

(assert (= (and b!145340 res!121534) b!145346))

(assert (= (and b!145349 res!121528) b!145350))

(assert (= (and b!145350 res!121529) b!145351))

(assert (= (and b!145351 res!121524) b!145353))

(assert (= (and b!145353 (not res!121527)) b!145347))

(assert (= (and b!145349 res!121531) b!145344))

(assert (= (and b!145349 res!121532) b!145343))

(assert (= (and b!145349 res!121522) b!145354))

(assert (= start!28024 b!145342))

(declare-fun m!223583 () Bool)

(assert (=> b!145349 m!223583))

(declare-fun m!223585 () Bool)

(assert (=> b!145349 m!223585))

(declare-fun m!223587 () Bool)

(assert (=> b!145349 m!223587))

(declare-fun m!223589 () Bool)

(assert (=> b!145349 m!223589))

(declare-fun m!223591 () Bool)

(assert (=> b!145349 m!223591))

(declare-fun m!223593 () Bool)

(assert (=> b!145349 m!223593))

(declare-fun m!223595 () Bool)

(assert (=> b!145349 m!223595))

(declare-fun m!223597 () Bool)

(assert (=> b!145349 m!223597))

(declare-fun m!223599 () Bool)

(assert (=> b!145349 m!223599))

(declare-fun m!223601 () Bool)

(assert (=> b!145349 m!223601))

(declare-fun m!223603 () Bool)

(assert (=> b!145349 m!223603))

(declare-fun m!223605 () Bool)

(assert (=> b!145349 m!223605))

(assert (=> b!145349 m!223601))

(declare-fun m!223607 () Bool)

(assert (=> b!145349 m!223607))

(declare-fun m!223609 () Bool)

(assert (=> b!145349 m!223609))

(declare-fun m!223611 () Bool)

(assert (=> b!145349 m!223611))

(declare-fun m!223613 () Bool)

(assert (=> b!145349 m!223613))

(declare-fun m!223615 () Bool)

(assert (=> b!145349 m!223615))

(declare-fun m!223617 () Bool)

(assert (=> b!145349 m!223617))

(declare-fun m!223619 () Bool)

(assert (=> b!145349 m!223619))

(declare-fun m!223621 () Bool)

(assert (=> b!145349 m!223621))

(declare-fun m!223623 () Bool)

(assert (=> b!145349 m!223623))

(declare-fun m!223625 () Bool)

(assert (=> b!145345 m!223625))

(declare-fun m!223627 () Bool)

(assert (=> b!145345 m!223627))

(declare-fun m!223629 () Bool)

(assert (=> start!28024 m!223629))

(declare-fun m!223631 () Bool)

(assert (=> start!28024 m!223631))

(declare-fun m!223633 () Bool)

(assert (=> b!145340 m!223633))

(declare-fun m!223635 () Bool)

(assert (=> b!145341 m!223635))

(assert (=> b!145346 m!223601))

(declare-fun m!223637 () Bool)

(assert (=> b!145346 m!223637))

(declare-fun m!223639 () Bool)

(assert (=> b!145346 m!223639))

(declare-fun m!223641 () Bool)

(assert (=> b!145348 m!223641))

(declare-fun m!223643 () Bool)

(assert (=> b!145354 m!223643))

(declare-fun m!223645 () Bool)

(assert (=> b!145353 m!223645))

(declare-fun m!223647 () Bool)

(assert (=> b!145353 m!223647))

(declare-fun m!223649 () Bool)

(assert (=> b!145353 m!223649))

(assert (=> b!145353 m!223613))

(declare-fun m!223651 () Bool)

(assert (=> b!145351 m!223651))

(declare-fun m!223653 () Bool)

(assert (=> b!145347 m!223653))

(declare-fun m!223655 () Bool)

(assert (=> b!145342 m!223655))

(declare-fun m!223657 () Bool)

(assert (=> b!145344 m!223657))

(declare-fun m!223659 () Bool)

(assert (=> b!145350 m!223659))

(assert (=> b!145350 m!223625))

(check-sat (not b!145347) (not b!145342) (not b!145345) (not start!28024) (not b!145350) (not b!145353) (not b!145354) (not b!145351) (not b!145349) (not b!145348) (not b!145344) (not b!145346) (not b!145341) (not b!145340))

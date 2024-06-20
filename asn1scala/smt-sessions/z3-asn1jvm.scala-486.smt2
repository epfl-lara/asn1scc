; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14342 () Bool)

(assert start!14342)

(declare-fun b!74367 () Bool)

(declare-fun res!61475 () Bool)

(declare-fun e!48619 () Bool)

(assert (=> b!74367 (=> res!61475 e!48619)))

(declare-datatypes ((array!3030 0))(
  ( (array!3031 (arr!2010 (Array (_ BitVec 32) (_ BitVec 8))) (size!1416 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2406 0))(
  ( (BitStream!2407 (buf!1797 array!3030) (currentByte!3541 (_ BitVec 32)) (currentBit!3536 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2406)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74367 (= res!61475 (not (invariant!0 (currentBit!3536 thiss!1379) (currentByte!3541 thiss!1379) (size!1416 (buf!1797 thiss!1379)))))))

(declare-fun b!74368 () Bool)

(declare-fun res!61473 () Bool)

(declare-fun e!48621 () Bool)

(assert (=> b!74368 (=> (not res!61473) (not e!48621))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74368 (= res!61473 (validate_offset_bits!1 ((_ sign_extend 32) (size!1416 (buf!1797 thiss!1379))) ((_ sign_extend 32) (currentByte!3541 thiss!1379)) ((_ sign_extend 32) (currentBit!3536 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74369 () Bool)

(assert (=> b!74369 (= e!48621 (not e!48619))))

(declare-fun res!61476 () Bool)

(assert (=> b!74369 (=> res!61476 e!48619)))

(declare-fun lt!119688 () (_ BitVec 64))

(assert (=> b!74369 (= res!61476 (or (bvslt i!635 to!314) (not (= lt!119688 (bvsub (bvadd lt!119688 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2406 BitStream!2406) Bool)

(assert (=> b!74369 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4909 0))(
  ( (Unit!4910) )
))
(declare-fun lt!119689 () Unit!4909)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2406) Unit!4909)

(assert (=> b!74369 (= lt!119689 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74369 (= lt!119688 (bitIndex!0 (size!1416 (buf!1797 thiss!1379)) (currentByte!3541 thiss!1379) (currentBit!3536 thiss!1379)))))

(declare-fun res!61474 () Bool)

(assert (=> start!14342 (=> (not res!61474) (not e!48621))))

(declare-fun srcBuffer!2 () array!3030)

(assert (=> start!14342 (= res!61474 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1416 srcBuffer!2))))))))

(assert (=> start!14342 e!48621))

(assert (=> start!14342 true))

(declare-fun array_inv!1262 (array!3030) Bool)

(assert (=> start!14342 (array_inv!1262 srcBuffer!2)))

(declare-fun e!48623 () Bool)

(declare-fun inv!12 (BitStream!2406) Bool)

(assert (=> start!14342 (and (inv!12 thiss!1379) e!48623)))

(declare-fun b!74370 () Bool)

(assert (=> b!74370 (= e!48623 (array_inv!1262 (buf!1797 thiss!1379)))))

(declare-fun b!74371 () Bool)

(assert (=> b!74371 (= e!48619 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!6410 0))(
  ( (tuple2!6411 (_1!3319 BitStream!2406) (_2!3319 BitStream!2406)) )
))
(declare-fun lt!119687 () tuple2!6410)

(declare-fun reader!0 (BitStream!2406 BitStream!2406) tuple2!6410)

(assert (=> b!74371 (= lt!119687 (reader!0 thiss!1379 thiss!1379))))

(assert (= (and start!14342 res!61474) b!74368))

(assert (= (and b!74368 res!61473) b!74369))

(assert (= (and b!74369 (not res!61476)) b!74367))

(assert (= (and b!74367 (not res!61475)) b!74371))

(assert (= start!14342 b!74370))

(declare-fun m!119323 () Bool)

(assert (=> b!74367 m!119323))

(declare-fun m!119325 () Bool)

(assert (=> b!74371 m!119325))

(declare-fun m!119327 () Bool)

(assert (=> b!74369 m!119327))

(declare-fun m!119329 () Bool)

(assert (=> b!74369 m!119329))

(declare-fun m!119331 () Bool)

(assert (=> b!74369 m!119331))

(declare-fun m!119333 () Bool)

(assert (=> b!74370 m!119333))

(declare-fun m!119335 () Bool)

(assert (=> b!74368 m!119335))

(declare-fun m!119337 () Bool)

(assert (=> start!14342 m!119337))

(declare-fun m!119339 () Bool)

(assert (=> start!14342 m!119339))

(check-sat (not b!74370) (not b!74368) (not start!14342) (not b!74367) (not b!74371) (not b!74369))
